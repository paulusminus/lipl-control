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

extension ListString<T extends Comparable> on List<T> {
  List<T> remove(T t) => where((element) => t != element).toList();
}
