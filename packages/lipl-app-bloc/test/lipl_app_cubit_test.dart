import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:lipl_model/lipl_model.dart';
import 'package:lipl_app_bloc/lipl_app_bloc.dart';
import 'package:loading_status/loading_status.dart';
import 'package:test/test.dart';

import 'lipl_rest_api_in_memory.dart';

const lyricPost1 = LyricPost(
  title: 'aan de amsterdamse grachten',
  parts: [],
);

const lyricPost2 = LyricPost(
  title: 'Breng eens een zonnetje',
  parts: [],
);

const lyricPost3 = LyricPost(
  title: 'Oh kindeke klein',
  parts: [],
);

const addingLyric = LyricPost(
  title: 'Adding lyric',
  parts: [],
);

const addingPlaylist = PlaylistPost(
  title: 'Allemaal helemaal te gek',
  members: [],
);

PlaylistPost initialPlaylistPost(String title, List<String> members) =>
    PlaylistPost(
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
                (e) => e.id,
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
        final cubit = LiplAppCubit(credentialsStream: const Stream.empty());
        expect(
          cubit.state.copyWith(credentials: null),
          LiplAppState.initial().copyWith(credentials: null),
        );
      });

      blocTest<LiplAppCubit, LiplAppState>(
        'load',
        build: () => LiplAppCubit(credentialsStream: const Stream.empty()),
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
        build: () => LiplAppCubit(credentialsStream: const Stream.empty()),
        seed: () => loaded(api),
        act: (cubit) async {
          await cubit.postLyric(addingLyric);
          final lyric = (await api.getLyrics())
              .firstWhere((element) => element.title == addingLyric.title);
          addedLyricId = lyric.id;
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
        build: () => LiplAppCubit(credentialsStream: const Stream.empty()),
        seed: () => loaded(api),
        act: (cubit) => cubit.deleteLyric(initialLyrics.first.id),
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
        build: () => LiplAppCubit(credentialsStream: const Stream.empty()),
        seed: () => loaded(api),
        act: (cubit) async => await cubit.putLyric(
          initialLyrics[1].copyWith(
            title: () => 'Breng eens een emmer',
          ),
        ),
        expect: () => [
          loaded(api).copyWith(status: LoadingStatus.changing),
          LiplAppState(
            lyrics: [
              initialLyrics[0],
              initialLyrics[1].copyWith(title: () => 'Breng eens een emmer'),
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
        build: () => LiplAppCubit(credentialsStream: const Stream.empty()),
        act: (cubit) async => await cubit.load(),
        expect: () => [
          LiplAppState.initial().copyWith(
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
        build: () => LiplAppCubit(credentialsStream: const Stream.empty()),
        act: (cubit) async => await cubit.load(),
        expect: () => [
          LiplAppState.initial().copyWith(
            status: LoadingStatus.loading,
          ),
          LiplAppState.initial().copyWith(
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
        build: () => LiplAppCubit(credentialsStream: const Stream.empty()),
        seed: () => loaded(errorApi),
        act: (cubit) async => await cubit.postLyric(const LyricPost(
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
        build: () => LiplAppCubit(credentialsStream: const Stream.empty()),
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
        build: () => LiplAppCubit(credentialsStream: const Stream.empty()),
        seed: () => loaded(errorApi),
        act: (cubit) async => await cubit.putLyric(
          initialLyrics[1].copyWith(
            title: () => 'Breng eens een emmer',
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
        build: () => LiplAppCubit(credentialsStream: const Stream.empty()),
        seed: () => loaded(api),
        act: (cubit) async {
          await cubit.postPlaylist(addingPlaylist);
          final playlist = (await api.getPlaylists())
              .firstWhere((element) => element.title == addingPlaylist.title);
          addedPlaylistId = playlist.id;
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
        build: () => LiplAppCubit(credentialsStream: const Stream.empty()),
        seed: () => loaded(api),
        act: (cubit) async =>
            await cubit.deletePlaylist(initialPlaylists.first.id),
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
        build: () => LiplAppCubit(credentialsStream: const Stream.empty()),
        seed: () => loaded(api),
        act: (cubit) async => await cubit.putPlaylist(
          initialPlaylists[0].copyWith(
            title: () => 'Breng eens wat meer',
          ),
        ),
        expect: () => [
          loaded(api).copyWith(status: LoadingStatus.changing),
          loaded(api).copyWith(
            playlists: [
              initialPlaylists[0].copyWith(
                title: () => 'Breng eens wat meer',
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
        build: () => LiplAppCubit(credentialsStream: const Stream.empty()),
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
        build: () => LiplAppCubit(credentialsStream: const Stream.empty()),
        seed: () => loaded(errorApi),
        act: (cubit) async =>
            await cubit.deletePlaylist(initialPlaylists[0].id),
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
        build: () => LiplAppCubit(credentialsStream: const Stream.empty()),
        seed: () => loaded(errorApi),
        act: (cubit) async => await cubit.putPlaylist(
          initialPlaylists[0].copyWith(
            title: () => 'Breng eens wat meer',
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
