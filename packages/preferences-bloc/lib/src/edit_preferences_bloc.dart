import 'package:bloc/bloc.dart';

abstract class EditPreferencesEvent<T> {}

class EditPreferencesEventChange<T> extends EditPreferencesEvent<T> {
  EditPreferencesEventChange({required this.preferences});
  final T preferences;
}

class EditPreferencesEventLoad<T> extends EditPreferencesEvent<T> {
  EditPreferencesEventLoad({required this.preferences});
  final T preferences;
}

class EditPreferencesState<T> {
  const EditPreferencesState({
    required this.preferences,
    required this.initialPreferences,
  });
  final T preferences;
  final T initialPreferences;

  factory EditPreferencesState.initial({
    required T preferences,
  }) =>
      EditPreferencesState(
        preferences: preferences,
        initialPreferences: preferences,
      );

  bool get hasChanged => preferences != initialPreferences;

  EditPreferencesState<T> copyWith({
    T Function()? preferences,
    T Function()? initialPreferences,
  }) =>
      EditPreferencesState(
        preferences: preferences == null ? this.preferences : preferences(),
        initialPreferences: initialPreferences == null
            ? this.initialPreferences
            : initialPreferences(),
      );

  @override
  int get hashCode => Object.hash(preferences, initialPreferences);

  @override
  operator ==(Object other) =>
      other is EditPreferencesState<T> &&
      other.preferences == preferences &&
      other.initialPreferences == initialPreferences;
}

class EditPreferencesBloc<T>
    extends Bloc<EditPreferencesEvent<T>, EditPreferencesState<T>> {
  EditPreferencesBloc({
    required T defaultValue,
  }) : super(
          EditPreferencesState.initial(preferences: defaultValue),
        ) {
    on<EditPreferencesEventChange<T>>(_onChange);
    on<EditPreferencesEventLoad<T>>(_onLoad);
  }

  void _onLoad(
    EditPreferencesEventLoad<T> event,
    Emitter<EditPreferencesState<T>> emit,
  ) {
    emit(
      state.copyWith(
        preferences: () => event.preferences,
        initialPreferences: () => event.preferences,
      ),
    );
  }

  void _onChange(EditPreferencesEventChange<T> event,
      Emitter<EditPreferencesState<T>> emit) {
    emit(state.copyWith(preferences: () => event.preferences));
  }
}
