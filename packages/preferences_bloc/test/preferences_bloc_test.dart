import 'package:bloc_test/bloc_test.dart';
import 'package:preferences_bloc/preferences_bloc.dart';
import 'package:test/test.dart';
import 'lipl_preferences.dart';
import 'persist_shared_preferences.dart';

class SharedPreferencesError extends Error {}

void main() {
  group('PreferencesBloc', () {
    LiplPreferences initialLiplPreferences() => const LiplPreferences(
          username: 'username 1',
          password: 'password 1',
          baseUrl: 'baseUrl 1',
        );

    LiplPreferences secundaryPreferences() => const LiplPreferences(
          username: 'username 2',
          password: 'password 2',
          baseUrl: 'baseUrl 2',
        );

    group('LiplPreferences', () {
      test('equality deserialize serialize', () {
        expect(
          initialLiplPreferences(),
          LiplPreferences.deserialize(initialLiplPreferences().serialize()),
        );
      });
    });

    group('State', () {
      test('constructor', () {
        final state = PreferencesState<LiplPreferences>.initial();
        expect(state.item, null);
        expect(state.status, PreferencesStatus.initial);
      });

      test('props', () async {
        final state = PreferencesState<LiplPreferences>(
          item: initialLiplPreferences(),
          status: PreferencesStatus.succes,
        );
        expect(state.props, [
          initialLiplPreferences(),
          PreferencesStatus.succes,
        ]);
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
        act: (bloc) => bloc.add(PreferencesEventLoad()),
        expect: () => [
          PreferencesState<LiplPreferences>.initial().copyWith(
            status: PreferencesStatus.loading,
          ),
          PreferencesState<LiplPreferences>(
            item: initialLiplPreferences(),
            status: PreferencesStatus.succes,
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
            status: PreferencesStatus.loading,
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
        seed: () => PreferencesState(
          item: initialLiplPreferences(),
          status: PreferencesStatus.succes,
        ),
        act: (bloc) => bloc.add(
          PreferencesEventChange(
            item: secundaryPreferences(),
          ),
        ),
        expect: () => [
          PreferencesState<LiplPreferences>(
            item: initialLiplPreferences(),
            status: PreferencesStatus.changing,
          ),
          PreferencesState<LiplPreferences>(
            item: secundaryPreferences(),
            status: PreferencesStatus.succes,
          ),
        ],
      ); // end allChanged

      blocTest<PreferencesBloc<LiplPreferences>,
          PreferencesState<LiplPreferences>>(
        'EventChange fails',
        build: () => createErrorSubject(),
        seed: () => PreferencesState<LiplPreferences>(
          item: initialLiplPreferences(),
          status: PreferencesStatus.succes,
        ),
        act: (bloc) => bloc.add(
          PreferencesEventChange(
            item: secundaryPreferences(),
          ),
        ),
        expect: () => [
          PreferencesState<LiplPreferences>(
            item: initialLiplPreferences(),
            status: PreferencesStatus.changing,
          ),
        ],
        errors: () => [isA<SharedPreferencesError>()],
      ); // end allChanged errors
    });
  });
}
