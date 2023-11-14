import 'package:preferences_bloc/preferences_bloc.dart';

import 'preferences_bloc_test.dart';

class PersistError<T> implements Persist<T> {
  @override
  Future<T?> load() {
    throw SharedPreferencesError();
  }

  @override
  Future<void> save(T? t) {
    throw SharedPreferencesError();
  }
}

class FakePersist<T> implements Persist<T> {
  FakePersist({
    T? initialValue,
  }) {
    _value = initialValue;
  }

  T? _value;

  @override
  Future<T?> load() async {
    return _value;
  }

  @override
  Future<void> save(T? t) async {
    _value = t;
  }
}
