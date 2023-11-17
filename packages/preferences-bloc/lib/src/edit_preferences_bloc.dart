import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:loading_status/loading_status.dart';
import 'package:preferences_bloc/preferences_bloc.dart';

abstract class EditPreferencesEvent<T> {}

class EditPreferencesEventChange<T> extends EditPreferencesEvent<T> {
  EditPreferencesEventChange({required this.preferences});
  final T preferences;
}

class EditPreferencesEventLoad<T> extends EditPreferencesEvent<T> {
  EditPreferencesEventLoad({required this.preferences});
  final T preferences;
}

class EditPreferencesState<T> extends Equatable {
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
  List<Object?> get props => [preferences, initialPreferences];
}

class EditPreferencesBloc<T>
    extends Bloc<EditPreferencesEvent<T>, EditPreferencesState<T>> {
  EditPreferencesBloc({
    required Stream<PreferencesState<T>> changes,
    required T defaultValue,
  }) : super(
          EditPreferencesState.initial(preferences: defaultValue),
        ) {
    _streamSubscription = changes
        .where((state) => state.status == LoadingStatus.success)
        .distinct()
        .listen(
      (state) {
        if (state.item != null) {
          add(
            EditPreferencesEventLoad<T>(
              preferences: state.item!,
            ),
          );
        }
      },
    );
    on<EditPreferencesEventChange<T>>(_onChange);
    on<EditPreferencesEventLoad<T>>(_onLoad);
  }

  late StreamSubscription<PreferencesState<T>> _streamSubscription;

  @override
  Future<void> close() async {
    await _streamSubscription.cancel();
    return super.close();
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
