import 'package:lipl_model/lipl_model.dart';

extension ListX<T extends Summary> on List<T> {
  List<T> removeItemById(String id) => where((t) => t.id != id).toList();

  List<T> sortByTitle() {
    final result = [...this];
    result.sort(
      (T a, T b) => a.title.compareTo(b.title),
    );
    return result;
  }

  List<T> addItem(T t) => [...this, t].sortByTitle();

  List<T> replaceItem(T t) => map(
        (T e) => e.id == t.id ? t : e,
      ).toList().sortByTitle();
}

extension ListLyricX on List<Lyric> {
  List<Lyric> removeItemById(String id) => where((t) => t.id != id).toList();

  List<Lyric> sortByTitle() {
    final result = [...this];
    result.sort(
      (Lyric a, Lyric b) => a.title.compareTo(b.title),
    );
    return result;
  }

  List<Lyric> addItem(Lyric t) => [...this, t].sortByTitle();

  List<Lyric> replaceItem(Lyric t) => map(
        (Lyric e) => e.id == t.id ? t : e,
      ).toList().sortByTitle();
}

extension ListLyricPartsX on List<Lyric> {
  List<LyricPart> toLyricParts() =>
      expand((lyric) => lyric.toLyricParts()).toList();
}

extension ListPlaylistX on List<Playlist> {
  List<Playlist> removeItemById(String id) => where((t) => t.id != id).toList();

  List<Playlist> sortByTitle() {
    final result = [...this];
    result.sort(
      (Playlist a, Playlist b) => a.title.compareTo(b.title),
    );
    return result;
  }

  List<Playlist> addItem(Playlist t) => [...this, t].sortByTitle();

  List<Playlist> replaceItem(Playlist t) => map(
        (Playlist e) => e.id == t.id ? t : e,
      ).toList().sortByTitle();
}

extension ListString<T extends Comparable> on List<T> {
  List<T> remove(T t) => where((element) => t != element).toList();
}
