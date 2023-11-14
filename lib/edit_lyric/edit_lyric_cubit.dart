import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lipl_model/lipl_model.dart';
import 'package:loading_status/loading_status.dart';

class EditLyricState extends Equatable {
  const EditLyricState({
    this.status = LoadingStatus.initial,
    this.id,
    this.title = '',
    this.text = '',
  });

  final LoadingStatus status;
  final String? id;
  final String title;
  final String text;

  bool get isNew => id == null;

  EditLyricState copyWith({
    LoadingStatus? status,
    String? id,
    String? title,
    String? text,
  }) =>
      EditLyricState(
        status: status ?? this.status,
        id: id ?? this.id,
        title: title ?? this.title,
        text: text ?? this.text,
      );

  @override
  List<Object?> get props => <Object?>[status, id, title, text];
}

class EditLyricCubit extends Cubit<EditLyricState> {
  EditLyricCubit({
    String? id,
    String? title,
    List<List<String>>? parts,
  }) : super(
          EditLyricState(
            id: id,
            title: title ?? '',
            text: parts == null ? '' : parts.toText(),
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
