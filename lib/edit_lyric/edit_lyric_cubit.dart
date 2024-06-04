import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lipl_model/lipl_model.dart';

part 'edit_lyric_cubit.freezed.dart';

@freezed
class EditLyricState with _$EditLyricState {
  const EditLyricState._();
  const factory EditLyricState({
    required bool isNew,
    @Default(LoadingStatus.initial) LoadingStatus status,
    required String id,
    required String title,
    required String text,
  }) = _EditLyricState;
}

class EditLyricCubit extends Cubit<EditLyricState> {
  EditLyricCubit({
    Lyric? lyric,
  }) : super(
          EditLyricState(
            isNew: lyric?.id == null,
            id: lyric?.id ?? newId(),
            title: lyric?.title ?? '',
            text: lyric?.parts.toText() ?? '',
          ),
        );

  void submitted() {
    emit(state.copyWith(status: LoadingStatus.success));
  }

  void titleChanged(String title) {
    emit(state.copyWith(title: title));
  }

  void textChanged(String text) {
    emit(state.copyWith(text: text));
  }
}
