import 'package:bloc_test/bloc_test.dart';
import 'package:loading_status/loading_status.dart';
import 'package:preferences_bloc/preferences_bloc.dart';
import 'package:test/test.dart';
import 'persist_shared_preferences.dart';
import 'package:lipl_model/lipl_model.dart';

class SharedPreferencesError extends Error {}

void main() {
  group('PreferencesBloc', () {
    LiplPreferences initialLiplPreferences() => const LiplPreferences(
          credentials: Credentials(
            username: 'username 1',
            password: 'password 1',
          ),
        );

    LiplPreferences secundaryPreferences() => const LiplPreferences(
          credentials: Credentials(
            username: 'username 2',
            password: 'password 2',
          ),
        );

    group('State', () {
      test('constructor', () {
        final state = PreferencesState<LiplPreferences>.initial();
        expect(state.item, null);
        expect(state.status, LoadingStatus.initial);
        expect(state, PreferencesState.initial());
      });
    });

    group('bloc', () {
      PreferencesBloc<LiplPreferences> createSubject({
        LiplPreferences? initialValue,
      }) =>
          PreferencesBloc<LiplPreferences>(
            persist: FakePersist<LiplPreferences>(
              initialValue: initialValue,
            ),
          );

      PreferencesBloc<LiplPreferences> createErrorSubject() =>
          PreferencesBloc<LiplPreferences>(
            persist: PersistError(),
          );

      blocTest<PreferencesBloc<LiplPreferences>,
          PreferencesState<LiplPreferences>>(
        'EventLoad',
        build: () => createSubject(
          initialValue: initialLiplPreferences(),
        ),
        act: (bloc) => bloc.add(PreferencesEventLoad<LiplPreferences>()),
        expect: () => [
          PreferencesState<LiplPreferences>.initial().copyWith(
            status: LoadingStatus.loading,
          ),
          PreferencesState<LiplPreferences>(
            item: initialLiplPreferences(),
            status: LoadingStatus.success,
          ),
        ],
      );

      blocTest<PreferencesBloc<LiplPreferences>,
          PreferencesState<LiplPreferences>>(
        'EventLoad fails',
        build: () => createErrorSubject(),
        act: (bloc) => bloc.add(
          PreferencesEventLoad(),
        ),
        expect: () => [
          PreferencesState<LiplPreferences>.initial().copyWith(
            status: LoadingStatus.loading,
          ),
        ],
        errors: () => [
          isA<SharedPreferencesError>(),
        ],
      );

      blocTest<PreferencesBloc<LiplPreferences>,
          PreferencesState<LiplPreferences>>(
        'EventChange',
        build: () => createSubject(),
        seed: () => PreferencesState<LiplPreferences>(
          item: initialLiplPreferences(),
          status: LoadingStatus.success,
        ),
        act: (bloc) => bloc.add(
          PreferencesEventChange<LiplPreferences>(
            item: secundaryPreferences(),
          ),
        ),
        expect: () => [
          PreferencesState<LiplPreferences>(
            item: initialLiplPreferences(),
            status: LoadingStatus.changing,
          ),
          PreferencesState<LiplPreferences>(
            item: secundaryPreferences(),
            status: LoadingStatus.success,
          ),
        ],
      ); // end allChanged

      blocTest<PreferencesBloc<LiplPreferences>,
          PreferencesState<LiplPreferences>>(
        'EventChange fails',
        build: () => createErrorSubject(),
        seed: () => PreferencesState<LiplPreferences>(
          item: initialLiplPreferences(),
          status: LoadingStatus.success,
        ),
        act: (bloc) => bloc.add(
          PreferencesEventChange(
            item: secundaryPreferences(),
          ),
        ),
        expect: () => [
          PreferencesState<LiplPreferences>(
            item: initialLiplPreferences(),
            status: LoadingStatus.changing,
          ),
        ],
        errors: () => [isA<SharedPreferencesError>()],
      ); // end allChanged errors
    });
  });
}
