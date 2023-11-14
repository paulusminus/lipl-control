import 'package:lipl_model/lipl_model.dart';
import 'package:test/test.dart';

void main() {
  group('LiplPreferences', () {
    LiplPreferences createSubject() => const LiplPreferences(
          credentials: Credentials(username: 'username', password: 'password'),
          lyrics: [],
          playlists: [],
        );

    test('Constructor', () {
      final LiplPreferences liplPreferences = createSubject();
      expect(
        liplPreferences.credentials?.username,
        'username',
      );
      expect(
        liplPreferences.credentials?.password,
        'password',
      );
    });

    test('Factory blank', () {
      final LiplPreferences liplPreferences = LiplPreferences.blank(false);
      expect(
        liplPreferences.credentials,
        null,
      );
    });

    test('Equality', () {
      expect(
        createSubject(),
        createSubject(),
      );
    });

    test('Props', () {
      expect(
        createSubject().props,
        <Object?>['username', 'password', 'baseUrl'],
      );
    });

    test('Json', () {
      expect(
        LiplPreferences.deserialize(createSubject().serialize()),
        createSubject(),
      );
    });

    test('Deserialize error', () {
      expect(
        () => LiplPreferences.deserialize('aslkjidf'),
        throwsFormatException,
      );
    });

    test('CopyWith equality', () {
      expect(
        createSubject().copyWith(),
        createSubject(),
      );
    });

    test('CopyWith change username', () {
      final LiplPreferences liplPreferences = createSubject().copyWith(
          credentials: () =>
              Credentials(username: 'username 2', password: 'hallo'));
      expect(liplPreferences.credentials?.username, 'username 2');
    });
  });
}
