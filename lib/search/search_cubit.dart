import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lipl_model/lipl_model.dart';

part 'search_cubit.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const SearchState._();
  const factory SearchState({
    @Default('') String searchTerm,
  }) = _SearchState;

  List<Lyric> searchResult(String searchTerm) => searchTerm.trim().length < 3
      ? <Lyric>[]
      : lyrics
          .where((Lyric lyric) =>
              lyric.title.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
}

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState(searchTerm: ''));

  void searchChanged(String value) {
    emit(state.copyWith(searchTerm: value));
  }

  void lyricsChanged(List<Lyric> lyrics) {
    emit(state.copyWith(lyrics: lyrics));
  }
}
