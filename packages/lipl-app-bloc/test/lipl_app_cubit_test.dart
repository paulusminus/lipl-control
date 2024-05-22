import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:lipl_model/lipl_model.dart';
import 'package:lipl_app_bloc/lipl_app_bloc.dart';
import 'package:loading_status/loading_status.dart';
import 'package:test/test.dart';

import 'lipl_rest_api_in_memory.dart';

final lyricPost1 = Lyric(
  id: newId(),
  title: 'aan de amsterdamse grachten',
  parts: [],
);

final lyricPost2 = Lyric(
  id: newId(),
  title: 'Breng eens een zonnetje',
  parts: [],
);

final lyricPost3 = Lyric(
  id: newId(),
  title: 'Oh kindeke klein',
  parts: [],
);

final addingLyric = Lyric(
  id: newId(),
  title: 'Adding lyric',
  parts: [],
);

final addingPlaylist = Playlist(
  id: null,
  title: 'Allemaal helemaal te gek',
  members: [],
);

Playlist initialPlaylistPost(String title, List<String> members) => Playlist(
      id: null,
      title: 'Alles',
      members: members,
    );

bool isSuccess(LiplAppState state) => state.status == LoadingStatus.success;

void main() {
  late List<Lyric> initialLyrics;
  late List<Playlist> initialPlaylists;
  late LiplRestApiInterface api;
  late LiplRestApiInterface errorApi;

  setUp(() async {
    api = InMemoryRestApi();
    initialLyrics = [
      await api.postLyric(lyricPost1),
      await api.postLyric(lyricPost2),
      await api.postLyric(lyricPost3),
    ];
    initialPlaylists = [
      await api.postPlaylist(
        initialPlaylistPost(
          'Alles',
          initialLyrics
              .map(
                (e) => e.id!,
              )
              .toList(),
        ),
      )
    ];
  });

  group('LiplRestCubit', () {
    late String addedLyricId;
    late String addedPlaylistId;

    LiplAppState loaded(LiplRestApiInterface api) => LiplAppState(
          lyrics: initialLyrics.sortByTitle(),
          playlists: initialPlaylists.sortByTitle(),
          status: LoadingStatus.success,
          credentials: null,
        );

    DioException error(String path) =>
        DioException(requestOptions: RequestOptions(path: path));

    DioException unauthorized(String path) => DioException(
          requestOptions: RequestOptions(path: path),
          response: Response(
            requestOptions: RequestOptions(path: path),
            statusCode: 401,
          ),
        );

    group('Lyric', () {
      test('Constructor', () {
        final cubit = LiplAppCubit(
          credentialsStream: const Stream.empty(),
          isWeb: false,
        );
        expect(
          cubit.state.copyWith(credentials: null),
          const LiplAppState().copyWith(credentials: null),
        );
      });

      blocTest<LiplAppCubit, LiplAppState>(
        'load',
        build: () => LiplAppCubit(
          credentialsStream: const Stream.empty(),
          isWeb: false,
          api: api,
        ),
        act: (cubit) async => await cubit.load(),
        expect: () => [
          const LiplAppState(
            lyrics: [],
            playlists: [],
            status: LoadingStatus.loading,
            credentials: null,
          ),
          loaded(api),
        ],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus add',
        build: () => LiplAppCubit(
          credentialsStream: const Stream.empty(),
          isWeb: false,
          api: api,
        ),
        seed: () => loaded(api),
        act: (cubit) async {
          await cubit.postLyric(addingLyric);
          final lyric = (await api.getLyrics())
              .firstWhere((element) => element.title == addingLyric.title);
          addedLyricId = lyric.id!;
        },
        expect: () => [
          loaded(api).copyWith(status: LoadingStatus.changing),
          LiplAppState(
            lyrics: [
              ...initialLyrics,
              Lyric(
                id: addedLyricId,
                title: addingLyric.title,
                parts: addingLyric.parts,
              )
            ].sortByTitle(),
            playlists: initialPlaylists.sortByTitle(),
            status: LoadingStatus.success,
            credentials: null,
          ),
        ],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus delete',
        build: () => LiplAppCubit(
          credentialsStream: const Stream.empty(),
          isWeb: false,
          api: api,
        ),
        seed: () => loaded(api),
        act: (cubit) => cubit.deleteLyric(initialLyrics.first.id!),
        expect: () => [
          loaded(api).copyWith(status: LoadingStatus.changing),
          LiplAppState(
            lyrics: initialLyrics
                .sortByTitle()
                .where(
                  (lyric) => lyric.id != initialLyrics.first.id,
                )
                .toList(),
            playlists: initialPlaylists
                .map((p) => Playlist(
                    id: p.id,
                    title: p.title,
                    members: p.members
                        .where(
                          (element) => element != initialLyrics.first.id,
                        )
                        .toList()))
                .toList(),
            status: LoadingStatus.success,
            credentials: null,
          ),
        ],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus change',
        build: () => LiplAppCubit(
          credentialsStream: const Stream.empty(),
          isWeb: false,
          api: api,
        ),
        seed: () => loaded(api),
        act: (cubit) async => await cubit.putLyric(
          initialLyrics[1].copyWith(
            title: 'Breng eens een emmer',
          ),
        ),
        expect: () => [
          loaded(api).copyWith(status: LoadingStatus.changing),
          LiplAppState(
            lyrics: [
              initialLyrics[0],
              initialLyrics[1].copyWith(title: 'Breng eens een emmer'),
              initialLyrics[2],
            ].sortByTitle(),
            playlists: initialPlaylists.sortByTitle(),
            status: LoadingStatus.success,
            credentials: null,
          )
        ],
      );
    }); // end group Lyric

    group('Lyric exceptions', () {
      blocTest<LiplAppCubit, LiplAppState>(
        'load',
        setUp: () {
          errorApi = ExceptionsRestApi(error('lyric'));
        },
        build: () => LiplAppCubit(
          credentialsStream: const Stream.empty(),
          isWeb: false,
          api: errorApi,
        ),
        act: (cubit) async => await cubit.load(),
        expect: () => [
          const LiplAppState().copyWith(
            status: LoadingStatus.loading,
            credentials: null,
          ),
        ],
        errors: () => [isA<DioException>()],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load unauthorized',
        setUp: () {
          errorApi = ExceptionsRestApi(unauthorized('lyric'));
        },
        build: () => LiplAppCubit(
            credentialsStream: const Stream.empty(),
            isWeb: false,
            api: errorApi),
        act: (cubit) async => await cubit.load(),
        expect: () => [
          const LiplAppState().copyWith(
            status: LoadingStatus.loading,
          ),
          const LiplAppState().copyWith(
            status: LoadingStatus.unauthorized,
          )
        ],
        errors: () => [isA<DioException>()],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus add',
        setUp: () {
          errorApi = ExceptionsRestApi(error('lyric/5'));
        },
        build: () => LiplAppCubit(
          credentialsStream: const Stream.empty(),
          isWeb: false,
          api: errorApi,
        ),
        seed: () => loaded(errorApi),
        act: (cubit) async => await cubit.postLyric(Lyric(
          id: newId(),
          title: 'Whatever',
          parts: [],
        )),
        wait: const Duration(milliseconds: 10),
        expect: () => [
          loaded(errorApi).copyWith(
            status: LoadingStatus.changing,
          )
        ],
        errors: () => [isA<DioException>()],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus delete',
        setUp: () {
          errorApi = ExceptionsRestApi(error('lyric/5'));
        },
        build: () => LiplAppCubit(
          credentialsStream: const Stream.empty(),
          isWeb: false,
          api: errorApi,
        ),
        seed: () => loaded(errorApi),
        act: (cubit) async => await cubit.deleteLyric('5'),
        expect: () => [
          loaded(errorApi).copyWith(status: LoadingStatus.changing),
        ],
        errors: () => [isA<DioException>()],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus change',
        setUp: () {
          errorApi = ExceptionsRestApi(error('lyric/5'));
        },
        build: () => LiplAppCubit(
            credentialsStream: const Stream.empty(),
            isWeb: false,
            api: errorApi),
        seed: () => loaded(errorApi),
        act: (cubit) async => await cubit.putLyric(
          initialLyrics[1].copyWith(
            title: 'Breng eens een emmer',
          ),
        ),
        expect: () => [
          loaded(errorApi).copyWith(status: LoadingStatus.changing),
        ],
        errors: () => [isA<DioException>()],
      );
    }); // end group Lyric Exceptions

    group('Playlist', () {
      blocTest<LiplAppCubit, LiplAppState>(
        'load plus add',
        build: () => LiplAppCubit(
          credentialsStream: const Stream.empty(),
          isWeb: false,
          api: api,
        ),
        seed: () => loaded(api),
        act: (cubit) async {
          await cubit.postPlaylist(addingPlaylist);
          final playlist = (await api.getPlaylists())
              .firstWhere((element) => element.title == addingPlaylist.title);
          addedPlaylistId = playlist.id!;
        },
        expect: () => [
          loaded(api).copyWith(status: LoadingStatus.changing),
          loaded(api).copyWith(
            playlists: [
              ...initialPlaylists,
              Playlist(
                id: addedPlaylistId,
                title: addingPlaylist.title,
                members: addingPlaylist.members,
              )
            ].sortByTitle(),
          )
        ],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus delete',
        build: () => LiplAppCubit(
          credentialsStream: const Stream.empty(),
          isWeb: false,
          api: api,
        ),
        seed: () => loaded(api),
        act: (cubit) async =>
            await cubit.deletePlaylist(initialPlaylists.first.id!),
        expect: () => [
          loaded(api).copyWith(status: LoadingStatus.changing),
          loaded(api).copyWith(
              playlists: initialPlaylists
                  .sortByTitle()
                  .where((playlist) => playlist.id != initialPlaylists.first.id)
                  .toList())
        ],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus change',
        build: () => LiplAppCubit(
          credentialsStream: const Stream.empty(),
          isWeb: false,
          api: api,
        ),
        seed: () => loaded(api),
        act: (cubit) async => await cubit.putPlaylist(
          initialPlaylists[0].copyWith(
            title: 'Breng eens wat meer',
          ),
        ),
        expect: () => [
          loaded(api).copyWith(status: LoadingStatus.changing),
          loaded(api).copyWith(
            playlists: [
              initialPlaylists[0].copyWith(
                title: 'Breng eens wat meer',
              ),
            ].sortByTitle(),
          )
        ],
      );
    }); // end group Playlist

    group('Playlist Exceptions', () {
      blocTest<LiplAppCubit, LiplAppState>(
        'load plus add',
        setUp: () {
          errorApi = ExceptionsRestApi(error('playlist'));
        },
        build: () => LiplAppCubit(
          credentialsStream: const Stream.empty(),
          isWeb: false,
          api: errorApi,
        ),
        seed: () => loaded(errorApi),
        act: (cubit) async => await cubit.postPlaylist(addingPlaylist),
        expect: () => [
          loaded(errorApi).copyWith(status: LoadingStatus.changing),
        ],
        errors: () => [isA<DioException>()],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus delete',
        setUp: () {
          errorApi = ExceptionsRestApi(error('playlist/4'));
        },
        build: () => LiplAppCubit(
            credentialsStream: const Stream.empty(),
            isWeb: false,
            api: errorApi),
        seed: () => loaded(errorApi),
        act: (cubit) async =>
            await cubit.deletePlaylist(initialPlaylists[0].id!),
        expect: () => [
          loaded(errorApi).copyWith(status: LoadingStatus.changing),
        ],
        errors: () => [isA<DioException>()],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus change',
        setUp: () {
          errorApi = ExceptionsRestApi(error('playlist/4'));
        },
        build: () => LiplAppCubit(
          credentialsStream: const Stream.empty(),
          isWeb: false,
          api: errorApi,
        ),
        seed: () => loaded(errorApi),
        act: (cubit) async => await cubit.putPlaylist(
          initialPlaylists[0].copyWith(
            title: 'Breng eens wat meer',
          ),
        ),
        expect: () => [
          loaded(errorApi).copyWith(status: LoadingStatus.changing),
        ],
        errors: () => [isA<DioException>()],
      );
    });
  });
}
