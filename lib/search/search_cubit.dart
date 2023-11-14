import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lipl_model/lipl_model.dart';

class SearchState extends Equatable {
  const SearchState({required this.searchTerm, required this.lyrics});
  final String searchTerm;
  final List<Lyric> lyrics;

  List<Lyric> get searchResult => searchTerm.trim().length < 3
      ? <Lyric>[]
      : lyrics
          .where((Lyric lyric) =>
              lyric.title.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();

  SearchState copyWith({
    String? searchTerm,
    List<Lyric>? lyrics,
  }) =>
      SearchState(
        searchTerm: searchTerm ?? this.searchTerm,
        lyrics: lyrics ?? this.lyrics,
      );

  @override
  List<Object?> get props => <Object?>[searchTerm, lyrics];
}

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required Stream<List<Lyric>> lyricsStream})
      : super(const SearchState(searchTerm: '', lyrics: <Lyric>[])) {
    _subscription = lyricsStream.listen((List<Lyric> lyrics) {
      emit(state.copyWith(lyrics: lyrics));
    });
  }

  late StreamSubscription<void> _subscription;

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }

  void search(String value) {
    emit(state.copyWith(searchTerm: value));
  }
}
