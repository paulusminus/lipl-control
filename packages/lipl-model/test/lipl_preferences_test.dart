// import 'package:lipl_model/src/model/model.dart';
import 'dart:convert';

import 'package:lipl_model/src/model/model.dart';
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
      final LiplPreferences liplPreferences = LiplPreferences();
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

    test('json string', () {
      expect(jsonEncode(createSubject().toJson()),
          '{"credentials":{"username":"username","password":"password"},"lyrics":[],"playlists":[]}');
    });

    test('Json', () {
      expect(
        LiplPreferences.fromJson(createSubject().toJson()),
        createSubject(),
      );
    });

    test('CopyWith equality', () {
      expect(
        createSubject().copyWith(),
        createSubject(),
      );
    });

    test('CopyWith change username', () {
      final LiplPreferences? liplPreferences =
          createSubject().copyWith.credentials?.call(
                username: 'username 2',
                password: 'hallo',
              );
      expect(liplPreferences?.credentials?.username, 'username 2');
    });
  });
}
