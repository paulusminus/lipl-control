import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lipl_control/edit_playlist/edit_playlist_cubit.dart';
import 'package:lipl_model/lipl_model.dart';
import 'package:loading_status/loading_status.dart';

void main() {
  group(
    'EditPlaylistCubit',
    () {
      Lyric createSubjectLyric1() =>
          const Lyric(id: '1', title: 'title 1', parts: <List<String>>[]);

      Lyric createSubjectLyric2() =>
          const Lyric(id: '2', title: 'title 2', parts: <List<String>>[]);

      Lyric createSubjectLyric3() =>
          const Lyric(id: '3', title: 'title 3', parts: <List<String>>[]);

      group(
        'EditPlaylistStatus',
        () {
          test(
            'isLoadingOrSuccess',
            () {
              expect(LoadingStatus.loading.isLoadingOrSuccess, true);
              expect(LoadingStatus.success.isLoadingOrSuccess, true);
              expect(LoadingStatus.initial.isLoadingOrSuccess, false);
              expect(LoadingStatus.failure.isLoadingOrSuccess, false);
            },
          );
        },
      );

      group(
        'EditPlaylistState',
        () {
          EditPlaylistState createSubject() => EditPlaylistState(
                id: 'id 1',
                status: LoadingStatus.success,
                title: 'title 1',
                search: 'search 1',
                members: <Lyric>[createSubjectLyric1()],
                lyrics: <Lyric>[
                  createSubjectLyric1(),
                  createSubjectLyric2(),
                ],
              );
          test(
            'Constructor',
            () {
              const EditPlaylistState state = EditPlaylistState();

              expect(state.status, LoadingStatus.initial);
              expect(state.id, null);
              expect(state.title, '');
              expect(state.search, '');
              expect(state.members, <Lyric>[]);
              expect(state.lyrics, <Lyric>[]);
              expect(state.isNew, true);
              expect(state.filtered, <Lyric>[]);
            },
          );

          test(
            'Equality',
            () {
              expect(createSubject(), createSubject());
            },
          );

          test(
            'CopyWith without parameters',
            () {
              final EditPlaylistState state = createSubject();
              expect(state, state.copyWith());
            },
          );

          test(
            'CopyWith changing id',
            () {
              final EditPlaylistState state = createSubject();
              expect(state.id, 'id 1');
              final EditPlaylistState newState = state.copyWith(id: 'id 5');
              expect(newState.id, 'id 5');
            },
          );

          test(
            'Filtered',
            () {
              final EditPlaylistState state =
                  createSubject().copyWith(search: 'e 1');
              expect(state.filtered, <Lyric>[createSubjectLyric1()]);
            },
          );
        },
      );

      group(
        'Cubit',
        () {
          test(
            'Constructor',
            () {
              final EditPlaylistCubit cubit = EditPlaylistCubit(
                id: 'id 1',
                title: 'title 1',
                members: null,
                lyrics: null,
              );
              expect(cubit.state.lyrics, <Lyric>[]);
              expect(cubit.state.members, <Lyric>[]);
              expect(cubit.state.id, 'id 1');
              expect(cubit.state.title, 'title 1');
            },
          );
          blocTest<EditPlaylistCubit, EditPlaylistState>(
            'title changed',
            build: () => EditPlaylistCubit(
              id: null,
              title: 'title 1',
              lyrics: <Lyric>[createSubjectLyric1(), createSubjectLyric2()],
              members: <Lyric>[createSubjectLyric2()],
            ),
            act: (EditPlaylistCubit cubit) => cubit.titleChanged('title 5'),
            expect: () => <EditPlaylistState>[
              EditPlaylistState(
                status: LoadingStatus.initial,
                id: null,
                title: 'title 5',
                search: '',
                members: <Lyric>[createSubjectLyric2()],
                lyrics: <Lyric>[
                  createSubjectLyric1(),
                  createSubjectLyric2(),
                ],
              )
            ],
          );

          blocTest<EditPlaylistCubit, EditPlaylistState>(
            'search changed',
            build: () => EditPlaylistCubit(
              id: null,
              title: 'title 1',
              lyrics: <Lyric>[createSubjectLyric1(), createSubjectLyric2()],
              members: <Lyric>[createSubjectLyric2()],
            ),
            act: (EditPlaylistCubit cubit) => cubit.searchChanged('search 5'),
            expect: () => <EditPlaylistState>[
              EditPlaylistState(
                status: LoadingStatus.initial,
                id: null,
                title: 'title 1',
                search: 'search 5',
                members: <Lyric>[createSubjectLyric2()],
                lyrics: <Lyric>[
                  createSubjectLyric1(),
                  createSubjectLyric2(),
                ],
              )
            ],
          );

          blocTest<EditPlaylistCubit, EditPlaylistState>(
            'submitted',
            build: () => EditPlaylistCubit(
              id: null,
              title: 'title 1',
              lyrics: <Lyric>[createSubjectLyric1(), createSubjectLyric2()],
              members: <Lyric>[createSubjectLyric2()],
            ),
            act: (EditPlaylistCubit cubit) => cubit.submitted(),
            expect: () => <EditPlaylistState>[
              EditPlaylistState(
                status: LoadingStatus.success,
                id: null,
                title: 'title 1',
                search: '',
                members: <Lyric>[createSubjectLyric2()],
                lyrics: <Lyric>[
                  createSubjectLyric1(),
                  createSubjectLyric2(),
                ],
              )
            ],
          );

          blocTest<EditPlaylistCubit, EditPlaylistState>(
            'Members item deleted',
            build: () => EditPlaylistCubit(
              id: null,
              title: 'title 1',
              lyrics: <Lyric>[createSubjectLyric1(), createSubjectLyric2()],
              members: <Lyric>[createSubjectLyric2()],
            ),
            act: (EditPlaylistCubit cubit) =>
                cubit.membersItemDeleted(createSubjectLyric2().id!),
            expect: () => <EditPlaylistState>[
              EditPlaylistState(
                status: LoadingStatus.initial,
                id: null,
                title: 'title 1',
                search: '',
                members: const <Lyric>[],
                lyrics: <Lyric>[
                  createSubjectLyric1(),
                  createSubjectLyric2(),
                ],
              )
            ],
          );

          blocTest<EditPlaylistCubit, EditPlaylistState>(
            'Members item added',
            build: () => EditPlaylistCubit(
              id: null,
              title: 'title 1',
              lyrics: <Lyric>[createSubjectLyric1(), createSubjectLyric2()],
              members: <Lyric>[createSubjectLyric2()],
            ),
            act: (EditPlaylistCubit cubit) =>
                cubit.membersItemAdded(createSubjectLyric3()),
            expect: () => <EditPlaylistState>[
              EditPlaylistState(
                status: LoadingStatus.initial,
                id: null,
                title: 'title 1',
                search: '',
                members: <Lyric>[createSubjectLyric2(), createSubjectLyric3()],
                lyrics: <Lyric>[
                  createSubjectLyric1(),
                  createSubjectLyric2(),
                ],
              )
            ],
          );

          blocTest<EditPlaylistCubit, EditPlaylistState>(
            'Members changed',
            build: () => EditPlaylistCubit(
              id: null,
              title: 'title 1',
              lyrics: <Lyric>[createSubjectLyric1(), createSubjectLyric2()],
              members: <Lyric>[createSubjectLyric1(), createSubjectLyric2()],
            ),
            act: (EditPlaylistCubit cubit) => cubit.membersChanged(1, 0),
            expect: () => <EditPlaylistState>[
              EditPlaylistState(
                status: LoadingStatus.initial,
                id: null,
                title: 'title 1',
                search: '',
                members: <Lyric>[createSubjectLyric2(), createSubjectLyric1()],
                lyrics: <Lyric>[
                  createSubjectLyric1(),
                  createSubjectLyric2(),
                ],
              )
            ],
          );
        },
      );
    },
  );
}
