import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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

enum PreferencesStatus { initial, loading, succes, changing }

class PreferencesState<T extends Equatable> extends Equatable {
  const PreferencesState({
    required this.item,
    required this.status,
  });

  final T? item;
  final PreferencesStatus status;

  factory PreferencesState.initial() => const PreferencesState(
        item: null,
        status: PreferencesStatus.initial,
      );

  PreferencesState<T> copyWith({
    T? Function()? item,
    PreferencesStatus? status,
  }) =>
      PreferencesState<T>(
        item: item == null ? this.item : item(),
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [item, status];
}

class PreferencesBloc<T extends Equatable>
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
        status: PreferencesStatus.loading,
      ),
    );

    final T? item = await persist.load();

    emit(
      PreferencesState<T>(
        item: item,
        status: PreferencesStatus.succes,
      ),
    );
  }

  Future<void> _allChanged(
    PreferencesEventChange<T> event,
    Emitter<PreferencesState<T>> emit,
  ) async {
    if (event.item != state.item) {
      emit(state.copyWith(status: PreferencesStatus.changing));

      if (event.item != null) {
        await persist.save(event.item);
      }

      emit(
        state.copyWith(
          item: () => event.item,
          status: PreferencesStatus.succes,
        ),
      );
    }
  }
}
