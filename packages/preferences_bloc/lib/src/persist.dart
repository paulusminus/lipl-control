abstract class Persist<T> {
  Future<void> save(T? t);
  Future<T?> load();
}
