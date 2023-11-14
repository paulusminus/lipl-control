import 'package:flutter_test/flutter_test.dart';
import 'package:lipl_model/lipl_model.dart';

void main() {
  group('Serialization', () {
    test('serialize blank', () {
      final liplPreferences = LiplPreferences.blank(true);
      final s = liplPreferences.serialize();
      expect(
        s,
        '{"username":null,"password":null,"lyrics":[],"playlists":[]}',
      );
    });

    test('serialize username and password', () {
      const liplPreferences = LiplPreferences(
        lyrics: <Lyric>[],
        playlists: <Playlist>[],
        credentials: Credentials(username: 'paul', password: 'CumGranoSalis'),
      );
      final s = liplPreferences.serialize();
      expect(
        s,
        '{"username":"paul","password":"CumGranoSalis","lyrics":[],"playlists":[]}',
      );
    });

    test('serialize lyric', () {
      const liplPreferences = LiplPreferences(
        lyrics: <Lyric>[Lyric(id: '6', title: 'Kortjakje', parts: [])],
        playlists: <Playlist>[],
        credentials: Credentials(username: 'paul', password: 'CumGranoSalis'),
      );
      final s = liplPreferences.serialize();
      expect(
        s,
        '{"username":"paul","password":"CumGranoSalis","lyrics":[{"id":"6","title":"Kortjakje","parts":[]}],"playlists":[]}',
      );
    });
  });

  group('deserialize', () {
    test('lyric', () {
      const s =
          '{"username":"paul","password":"CumGranoSalis","lyrics":[{"id":"6","title":"Kortjakje","parts":[]}],"playlists":[]}';
      expect(
        LiplPreferences.deserialize(s),
        const LiplPreferences(
          credentials: Credentials(username: 'paul', password: 'CumGranoSalis'),
          lyrics: [Lyric(id: '6', title: 'Kortjakje', parts: [])],
          playlists: [],
        ),
      );
    });
  });
}
