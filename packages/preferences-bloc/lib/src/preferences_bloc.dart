import 'package:bloc/bloc.dart';
import 'package:loading_status/loading_status.dart';
import 'package:preferences_bloc/src/persist.dart';

abstract class PreferencesEvent<T> {}

class PreferencesEventLoad<T> extends PreferencesEvent<T> {
  PreferencesEventLoad();
}

class PreferencesEventChange<T> extends PreferencesEvent<T> {
  PreferencesEventChange({
    required this.item,
  });
  final T? item;
}

class PreferencesState<T> {
  const PreferencesState({
    required this.item,
    required this.status,
  });

  final T? item;
  final LoadingStatus status;

  factory PreferencesState.initial() => const PreferencesState(
        item: null,
        status: LoadingStatus.initial,
      );

  PreferencesState<T> copyWith({
    T? Function()? item,
    LoadingStatus? status,
  }) =>
      PreferencesState<T>(
        item: item == null ? this.item : item(),
        status: status ?? this.status,
      );

  @override
  int get hashCode => Object.hash(item, status);

  @override
  bool operator ==(Object other) =>
      (other is PreferencesState<T>) &&
      other.item == item &&
      other.status == status;
}

class PreferencesBloc<T>
    extends Bloc<PreferencesEvent<T>, PreferencesState<T>> {
  PreferencesBloc({
    required this.persist,
  }) : super(PreferencesState.initial()) {
    on<PreferencesEventLoad<T>>(_onLoad);
    on<PreferencesEventChange<T>>(_allChanged);
  }

  final Persist<T> persist;

  Future<void> _onLoad(
    PreferencesEventLoad<T> event,
    Emitter<PreferencesState<T>> emit,
  ) async {
    emit(
      state.copyWith(
        status: LoadingStatus.loading,
      ),
    );

    final T? item = await persist.load();

    emit(
      PreferencesState<T>(
        item: item,
        status: LoadingStatus.success,
      ),
    );
  }

  Future<void> _allChanged(
    PreferencesEventChange<T> event,
    Emitter<PreferencesState<T>> emit,
  ) async {
    if (event.item != state.item) {
      emit(state.copyWith(status: LoadingStatus.changing));

      if (event.item != null) {
        await persist.save(event.item);
      }

      emit(
        state.copyWith(
          item: () => event.item,
          status: LoadingStatus.success,
        ),
      );
    }
  }
}
