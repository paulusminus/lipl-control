import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lipl_model/lipl_model.dart';
import 'package:lipl_app_bloc/lipl_app_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'lipl_rest_api_in_memory.dart';

class MockStorage extends Mock implements Storage {}

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
  id: newId(),
  title: 'Allemaal helemaal te gek',
  members: [],
);

Playlist initialPlaylist(String title, List<String> members) => Playlist(
      id: newId(),
      title: 'Alles',
      members: members,
    );

bool isSuccess(LiplAppState state) => state.status == LoadingStatus.success;

void main() {
  late List<Lyric> initialLyrics;
  late List<Playlist> initialPlaylists;
  late LiplRestApiInterface api;
  late LiplRestApiInterface errorApi;
  late Storage storage;
  late DateTime now;

  setUp(() async {
    api = InMemoryRestApi(lyrics: [], playlists: []);
    await api.postLyric(lyricPost1);
    await api.postLyric(lyricPost2);
    await api.postLyric(lyricPost3);
    initialLyrics = await api.getLyrics();
    await api.postPlaylist(
      initialPlaylist(
        'Alles',
        initialLyrics
            .map(
              (e) => e.id!,
            )
            .toList(),
      ),
    );
    now = DateTime.now().toUtc();
    initialPlaylists = await api.getPlaylists();
    // mock storage for hydrated bloc
    storage = MockStorage();
    when(
      () => storage.write(any(), any<dynamic>()),
    ).thenAnswer((_) async {});
    HydratedBloc.storage = storage;
  });

  group('LiplAppCubit', () {
    late String addedLyricId;

    LiplAppState loaded(DateTime now) => LiplAppState(
          lyrics: initialLyrics.sortByTitle(),
          playlists: initialPlaylists.sortByTitle(),
          status: LoadingStatus.success,
          credentials: null,
          lastFetch: now,
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
        final cubit = LiplAppCubit();
        expect(
          cubit.state.copyWith(credentials: null),
          const LiplAppState().copyWith(credentials: null),
        );
      });

      blocTest<LiplAppCubit, LiplAppState>(
        'load',
        build: () => LiplAppCubit(
          api: api,
        ),
        act: (cubit) async => await cubit.load(time: now),
        expect: () => [
          const LiplAppState(
            lyrics: [],
            playlists: [],
            status: LoadingStatus.loading,
            credentials: null,
            lastFetch: null,
          ),
          loaded(now),
        ],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus add',
        build: () => LiplAppCubit(
          api: api,
        ),
        seed: () => loaded(now),
        act: (cubit) async {
          await cubit.postLyric(addingLyric);
          final lyric = (await api.getLyrics())
              .firstWhere((element) => element.title == addingLyric.title);
          addedLyricId = lyric.id!;
        },
        expect: () => [
          loaded(now).copyWith(status: LoadingStatus.changing),
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
            lastFetch: now,
          ),
        ],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus delete',
        build: () => LiplAppCubit(
          api: api,
        ),
        seed: () => loaded(now),
        act: (cubit) => cubit.deleteLyric(initialLyrics.first.id!),
        expect: () => [
          loaded(now).copyWith(status: LoadingStatus.changing),
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
            lastFetch: now,
          ),
        ],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus change',
        build: () => LiplAppCubit(
          api: api,
        ),
        seed: () => loaded(now),
        act: (cubit) async => await cubit.putLyric(
          initialLyrics[1].copyWith(
            title: 'Breng eens een emmer',
          ),
        ),
        expect: () => [
          loaded(now).copyWith(status: LoadingStatus.changing),
          LiplAppState(
            lyrics: [
              initialLyrics[0],
              initialLyrics[1].copyWith(title: 'Breng eens een emmer'),
              initialLyrics[2],
            ].sortByTitle(),
            playlists: initialPlaylists.sortByTitle(),
            status: LoadingStatus.success,
            credentials: null,
            lastFetch: now,
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
          api: errorApi,
        ),
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
          api: errorApi,
        ),
        seed: () => loaded(now),
        act: (cubit) async => await cubit.postLyric(Lyric(
          id: newId(),
          title: 'Whatever',
          parts: [],
        )),
        wait: const Duration(milliseconds: 10),
        expect: () => [
          loaded(now).copyWith(
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
          api: errorApi,
        ),
        seed: () => loaded(now),
        act: (cubit) async => await cubit.deleteLyric('5'),
        expect: () => [
          loaded(now).copyWith(status: LoadingStatus.changing),
        ],
        errors: () => [isA<DioException>()],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus change',
        setUp: () {
          errorApi = ExceptionsRestApi(error('lyric/5'));
        },
        build: () => LiplAppCubit(api: errorApi),
        seed: () => loaded(now),
        act: (cubit) async => await cubit.putLyric(
          initialLyrics[1].copyWith(
            title: 'Breng eens een emmer',
          ),
        ),
        expect: () => [
          loaded(now).copyWith(status: LoadingStatus.changing),
        ],
        errors: () => [isA<DioException>()],
      );
    }); // end group Lyric Exceptions

    group('Playlist', () {
      blocTest<LiplAppCubit, LiplAppState>(
        'load plus add',
        build: () => LiplAppCubit(
          api: api,
        ),
        seed: () => loaded(now),
        act: (cubit) async {
          await cubit.postPlaylist(addingPlaylist);
        },
        expect: () => [
          loaded(now).copyWith(status: LoadingStatus.changing),
          loaded(now).copyWith(
            playlists: [
              ...initialPlaylists,
              addingPlaylist,
            ].sortByTitle(),
          )
        ],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus delete',
        build: () => LiplAppCubit(
          api: api,
        ),
        seed: () => loaded(now),
        act: (cubit) async =>
            await cubit.deletePlaylist(initialPlaylists.first.id!),
        expect: () => [
          loaded(now).copyWith(status: LoadingStatus.changing),
          loaded(now).copyWith(
              playlists: initialPlaylists
                  .sortByTitle()
                  .where((playlist) => playlist.id != initialPlaylists.first.id)
                  .toList())
        ],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus change',
        build: () => LiplAppCubit(
          api: api,
        ),
        seed: () => loaded(now),
        act: (cubit) async => await cubit.putPlaylist(
          initialPlaylists[0].copyWith(
            title: 'Breng eens wat meer',
          ),
        ),
        expect: () => [
          loaded(now).copyWith(status: LoadingStatus.changing),
          loaded(now).copyWith(
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
          api: errorApi,
        ),
        seed: () => loaded(now),
        act: (cubit) async => await cubit.postPlaylist(addingPlaylist),
        expect: () => [
          loaded(now).copyWith(status: LoadingStatus.changing),
        ],
        errors: () => [isA<DioException>()],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus delete',
        setUp: () {
          errorApi = ExceptionsRestApi(error('playlist/4'));
        },
        build: () => LiplAppCubit(
          api: errorApi,
        ),
        seed: () => loaded(now),
        act: (cubit) async =>
            await cubit.deletePlaylist(initialPlaylists[0].id!),
        expect: () => [
          loaded(now).copyWith(status: LoadingStatus.changing),
        ],
        errors: () => [isA<DioException>()],
      );

      blocTest<LiplAppCubit, LiplAppState>(
        'load plus change',
        setUp: () {
          errorApi = ExceptionsRestApi(error('playlist/4'));
        },
        build: () => LiplAppCubit(
          api: errorApi,
        ),
        seed: () => loaded(now),
        act: (cubit) async => await cubit.putPlaylist(
          initialPlaylists[0].copyWith(
            title: 'Breng eens wat meer',
          ),
        ),
        expect: () => [
          loaded(now).copyWith(status: LoadingStatus.changing),
        ],
        errors: () => [isA<DioException>()],
      );
    });
  });
}
