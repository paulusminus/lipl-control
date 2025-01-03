import 'package:bloc/bloc.dart';

enum PlayTab { play, tv }

class PlayTabCubit extends Cubit<PlayTab> {
  PlayTabCubit() : super(PlayTab.play);

  void selectPlay() {
    emit(PlayTab.play);
  }

  void selectTv() {
    emit(PlayTab.tv);
  }
}
