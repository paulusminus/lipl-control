import 'package:bloc_test/bloc_test.dart';
import 'package:environment/environment.dart';
import 'package:loading_status/loading_status.dart';
import 'package:preferences_bloc/src/edit_preferences_bloc.dart';
import 'package:preferences_bloc/src/preferences_bloc.dart';
import 'package:test/test.dart';
import 'package:lipl_model/lipl_model.dart';

void main() {
  EditPreferencesBloc<LiplPreferences> createSubject() =>
      EditPreferencesBloc<LiplPreferences>(
        defaultValue: LiplPreferences(),
        changes: const Stream.empty(),
      );

  EditPreferencesBloc<LiplPreferences> createSubjectChanges() {
    return EditPreferencesBloc<LiplPreferences>(
      defaultValue: LiplPreferences(),
      changes: Stream.fromFutures(
        [
          Future.value(
            const PreferencesState<LiplPreferences>(
              item: LiplPreferences(
                credentials: Credentials(
                  username: 'Jos',
                  password: 'Knippen',
                ),
              ),
              status: LoadingStatus.success,
            ),
          ),
          Future.value(
            const PreferencesState<LiplPreferences>(
              item: LiplPreferences(
                credentials: Credentials(
                  username: 'Jos 2',
                  password: 'Knippen 2',
                ),
              ),
              status: LoadingStatus.success,
            ),
          ),
        ],
      ),
    );
  }

  group(
    'EditPreferencesBloc',
    () {
      test('State Equality', () {
        expect(createSubject().state, createSubject().state);
      });

      test('hasChanged false', () {
        final state = createSubject().state;
        expect(state.hasChanged, false);
      });

      test('hasChanged true', () {
        final state = createSubject().state;
        final newState = state.copyWith(
          preferences: () => state.preferences.copyWith(
            credentials: Credentials(username: 'testen maar'),
          ),
        );
        expect(newState.hasChanged, true);
      });

      blocTest<EditPreferencesBloc<LiplPreferences>,
          EditPreferencesState<LiplPreferences>>(
        'Load',
        build: () => createSubject(),
        act: (bloc) => bloc.add(
          EditPreferencesEventLoad<LiplPreferences>(
            preferences: LiplPreferences(
              credentials: Credentials(
                username: username(),
                password: password(),
              ),
            ),
          ),
        ),
        expect: () => [
          EditPreferencesState<LiplPreferences>(
            initialPreferences: LiplPreferences(
              credentials: Credentials(
                username: username(),
                password: password(),
              ),
            ),
            preferences: LiplPreferences(
              credentials: Credentials(
                username: username(),
                password: password(),
              ),
            ),
          ),
        ],
      );

      blocTest<EditPreferencesBloc<LiplPreferences>,
          EditPreferencesState<LiplPreferences>>(
        'Change',
        build: () => createSubject(),
        seed: () => EditPreferencesState<LiplPreferences>(
          initialPreferences: LiplPreferences(
            credentials: Credentials(
              username: username(),
              password: password(),
            ),
          ),
          preferences: LiplPreferences(
            credentials: Credentials(
              username: username(),
              password: password(),
            ),
          ),
        ),
        act: (bloc) => bloc.add(
          EditPreferencesEventChange(
            preferences: const LiplPreferences(
              credentials: Credentials(
                username: 'Piet',
                password: 'Puk',
              ),
            ),
          ),
        ),
        expect: () => [
          EditPreferencesState<LiplPreferences>(
            initialPreferences: LiplPreferences(
              credentials: Credentials(
                username: username(),
                password: password(),
              ),
            ),
            preferences: const LiplPreferences(
              credentials: Credentials(
                username: 'Piet',
                password: 'Puk',
              ),
            ),
          ),
        ],
      );

      blocTest<EditPreferencesBloc<LiplPreferences>,
          EditPreferencesState<LiplPreferences>>(
        'Changes',
        build: () => createSubjectChanges(),
        expect: () => [
          const EditPreferencesState<LiplPreferences>(
            initialPreferences: LiplPreferences(
              credentials: Credentials(
                username: 'Jos',
                password: 'Knippen',
              ),
            ),
            preferences: LiplPreferences(
              credentials: Credentials(
                username: 'Jos',
                password: 'Knippen',
              ),
            ),
          ),
          const EditPreferencesState<LiplPreferences>(
            initialPreferences: LiplPreferences(
              credentials: Credentials(
                username: 'Jos 2',
                password: 'Knippen 2',
              ),
            ),
            preferences: LiplPreferences(
              credentials: Credentials(
                username: 'Jos 2',
                password: 'Knippen 2',
              ),
            ),
          ),
        ],
      );
    },
  );
}
