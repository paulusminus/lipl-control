import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lipl_model/lipl_model.dart';

part 'search_cubit.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const SearchState._();
  const factory SearchState({
    @Default('') String searchTerm,
    @Default([]) List<Lyric> lyrics,
  }) = _SearchState;

  List<Lyric> get searchResult => searchTerm.trim().length < 3
      ? <Lyric>[]
      : lyrics
          .where((Lyric lyric) =>
              lyric.title.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
}

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState(searchTerm: '', lyrics: <Lyric>[]));

  void search(String value) {
    emit(state.copyWith(searchTerm: value));
  }

  void lyricsChanged(List<Lyric> lyrics) {
    emit(state.copyWith(lyrics: lyrics));
  }
}
