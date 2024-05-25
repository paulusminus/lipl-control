import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lipl_model/lipl_model.dart';
import 'package:loading_status/loading_status.dart';

part 'edit_playlist_cubit.freezed.dart';

@freezed
class EditPlaylistState with _$EditPlaylistState {
  const EditPlaylistState._();
  const factory EditPlaylistState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default(null) String? id,
    @Default('') String title,
    @Default('') String search,
    @Default([]) List<Lyric> members,
    @Default([]) List<Lyric> lyrics,
  }) = _EditPlaylistState;

  bool get isNew => id == null;

  List<Lyric> get filtered => lyrics
      .where(
        (Lyric lyric) =>
            lyric.title.toLowerCase().contains(search.toLowerCase()),
      )
      .toList();
}

class EditPlaylistCubit extends Cubit<EditPlaylistState> {
  EditPlaylistCubit({
    required String? id,
    required String? title,
    required List<Lyric>? members,
    required List<Lyric>? lyrics,
  }) : super(
          EditPlaylistState(
            id: id,
            title: title ?? '',
            members: members ?? <Lyric>[],
            lyrics: lyrics ?? <Lyric>[],
          ),
        );

  void submitted() {
    emit(
      state.copyWith(
        status: LoadingStatus.success,
      ),
    );
  }

  void membersItemDeleted(String id) {
    emit(
      state.copyWith(
        members: state.members.removeItemById(id),
      ),
    );
  }

  void membersItemAdded(Lyric lyric) {
    emit(
      state.copyWith(members: <Lyric>[...state.members, lyric], search: ''),
    );
  }

  void titleChanged(String title) {
    emit(state.copyWith(title: title));
  }

  void searchChanged(String search) {
    emit(state.copyWith(search: search));
  }

  void membersChanged(int oldIndex, int newIndex) {
    final List<Lyric> members = <Lyric>[...state.members];

    final Lyric removed = members.removeAt(oldIndex);
    members.insert(
      newIndex < oldIndex ? newIndex : newIndex - 1,
      removed,
    );
    emit(state.copyWith(members: members));
  }
}
