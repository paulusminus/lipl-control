import 'package:bloc/bloc.dart';

enum SelectedTab { lyrics, playlists }

class SelectedTabCubit extends Cubit<SelectedTab> {
  SelectedTabCubit() : super(SelectedTab.lyrics);

  void selectLyrics() {
    emit(SelectedTab.lyrics);
  }

  void selectPlaylists() {
    emit(SelectedTab.playlists);
  }
}
