import 'package:lipl_model/lipl_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Lyric', () {
    late Lyric lyric;
    late Map<String, dynamic> lyricJson;

    setUp(() {
      lyric = const Lyric(
        id: '1',
        title: 'title 1',
        parts: [],
      );
      lyricJson = {
        'id': '1',
        'title': 'title 1',
        'parts': [],
      };
    });

    test('Constructor', () {
      expect(
        lyric.id,
        '1',
      );
      expect(
        lyric.title,
        'title 1',
      );
      expect(
        lyric.parts,
        [],
      );
    });

    test('toJson', () {
      final Map<String, dynamic> json = lyric.toJson();
      expect(
        json['id'],
        '1',
      );
      expect(
        json['title'],
        'title 1',
      );
      expect(
        json['parts'],
        [],
      );
    });

    test('fromJson', () {
      final Lyric lyric = Lyric.fromJson(lyricJson);
      expect(
        lyric.id,
        '1',
      );
      expect(
        lyric.title,
        'title 1',
      );
      expect(
        lyric.parts,
        [],
      );
    });

    group('copyWith', () {
      test('no parameters', () {
        final Lyric copyLyric = lyric.copyWith();
        expect(
          copyLyric,
          lyric,
        );
      });

      test('change title', () {
        final Lyric copyLyric = lyric.copyWith(title: () => 'new title');
        expect(
          copyLyric.title,
          'new title',
        );
        expect(
          copyLyric.id,
          lyric.id,
        );
        expect(
          copyLyric.parts,
          lyric.parts,
        );
      });

      test('change parts', () {
        final newPart = [
          ['new part']
        ];
        final Lyric copyLyric = lyric.copyWith(
          parts: () => newPart,
        );
        expect(
          copyLyric.title,
          lyric.title,
        );
        expect(
          copyLyric.id,
          lyric.id,
        );
        expect(
          copyLyric.parts,
          newPart,
        );
      });
    });

    test('toString', () {
      expect(
        lyric.toString(),
        'Lyric: title 1',
      );
    });

    test('props', () {
      expect(
        lyric.props,
        [lyric.id, lyric.title, lyric.parts],
      );
    });
  });

  group('LyricPart', () {
    late Lyric lyric;
    setUp(() => {
          lyric = Lyric(
            id: '3',
            title: 'Er is er één jarig',
            parts: [
              [
                'Er is er één jarig hoera hoera',
                'Dat kun je wel zien dat is hij'
              ],
              [
                'Dat vinden wij allen zo prettig ja ja',
                'En daarom zingen wij blij',
              ],
            ],
          )
        });

    test('use indexed', () {
      expect(
        lyric.toLyricParts(),
        [
          LyricPart(
            title: 'Er is er één jarig',
            current: 1,
            total: 2,
            text:
                'Er is er één jarig hoera hoera\nDat kun je wel zien dat is hij',
          ),
          LyricPart(
            title: 'Er is er één jarig',
            current: 2,
            total: 2,
            text:
                'Dat vinden wij allen zo prettig ja ja\nEn daarom zingen wij blij',
          ),
        ],
      );
    });
  });

  group('LyricPost', () {
    late LyricPost lyricPost;
    late Map<String, dynamic> lyricPostJson;

    setUp(() {
      lyricPost = const LyricPost(title: 'title 1', parts: []);
      lyricPostJson = {
        'title': 'title 1',
        'parts': [],
      };
    });

    test('Constructor', () {
      const LyricPost lyricPost = LyricPost(title: 'title 1', parts: []);
      expect(
        lyricPost.title,
        'title 1',
      );
      expect(
        lyricPost.parts,
        [],
      );
    });

    test('toJson', () {
      final Map<String, dynamic> json = lyricPost.toJson();
      expect(
        json['title'],
        'title 1',
      );
      expect(
        json['parts'],
        [],
      );
    });

    test('fromJson', () {
      final LyricPost lyricPost = LyricPost.fromJson(lyricPostJson);
      expect(
        lyricPost.title,
        'title 1',
      );
      expect(
        lyricPost.parts,
        [],
      );
    });

    test('json equality', () {
      expect(
        LyricPost.fromJson(lyricPost.toJson()),
        lyricPost,
      );
    });

    test('props', () {
      expect(
        lyricPost.props,
        [lyricPost.title, lyricPost.parts],
      );
    });
  });

  group('Summary', () {
    late Summary summary;
    late Map<String, dynamic> summaryJson;

    setUp(() {
      summary = const Summary(
        id: '1',
        title: 'title 1',
      );
      summaryJson = {
        'id': '1',
        'title': 'title 1',
      };
    });

    test('Constructor', () {
      const summary = Summary(
        id: '1',
        title: 'title 1',
      );
      expect(
        summary.id,
        '1',
      );
      expect(
        summary.title,
        'title 1',
      );
    });

    test('toJson', () {
      final json = summary.toJson();
      expect(
        json['id'],
        '1',
      );
      expect(
        json['title'],
        'title 1',
      );
    });

    test('fromJson', () {
      final summary = Summary.fromJson(summaryJson);
      expect(
        summary.id,
        '1',
      );
      expect(
        summary.title,
        'title 1',
      );
    });

    test('json equality', () {
      expect(
        Summary.fromJson(summary.toJson()),
        summary,
      );
    });

    test('toString', () {
      expect(
        summary.toString(),
        'Summary: title 1',
      );
    });

    test('props', () {
      expect(
        summary.props,
        [summary.id, summary.title],
      );
    });
  });

  group('Playlist', () {
    late Playlist playlist;
    late Map<String, dynamic> playlistJson;

    setUp(() {
      playlist = const Playlist(
        id: '1',
        title: 'playlist 1',
        members: [],
      );
      playlistJson = {
        'id': '1',
        'title': 'playlist 1',
        'members': [],
      };
    });

    test('Constructor', () {
      const playlist = Playlist(
        id: '1',
        title: 'playlist 1',
        members: [],
      );

      expect(
        playlist.id,
        '1',
      );
      expect(
        playlist.title,
        'playlist 1',
      );
      expect(
        playlist.members,
        [],
      );
    });

    test('toJson', () {
      final json = playlist.toJson();
      expect(
        json['id'],
        '1',
      );
      expect(
        json['title'],
        'playlist 1',
      );
      expect(
        json['members'],
        [],
      );
    });

    test('fromJson', () {
      final playlist = Playlist.fromJson(playlistJson);
      expect(
        playlist.id,
        '1',
      );
      expect(
        playlist.title,
        'playlist 1',
      );
      expect(
        playlist.members,
        [],
      );
    });

    test('json equality', () {
      expect(
        Playlist.fromJson(playlist.toJson()),
        playlist,
      );
    });

    group('copyWith', () {
      test('no parameters', () {
        final p = playlist.copyWith();
        expect(
          p,
          playlist,
        );
      });

      test('change title', () {
        final p = playlist.copyWith(title: 'New Year');
        expect(
          p.title,
          'New Year',
        );
        expect(
          p.id,
          playlist.id,
        );
        expect(
          p.members,
          playlist.members,
        );
      });

      test('change members', () {
        final p = playlist.copyWith(members: ['452']);
        expect(
          p.title,
          playlist.title,
        );
        expect(
          p.id,
          playlist.id,
        );
        expect(
          p.members,
          ['452'],
        );
      });
    });

    test('withoutMember', () {
      const p =
          Playlist(id: '1', title: 'Playlist 1', members: ['2', '5', '10']);
      final Playlist newP = p.withoutMember('5');
      expect(newP.members, ['2', '10']);
    });

    test('toString', () {
      expect(
        playlist.toString(),
        'Playlist: playlist 1',
      );
    });

    test('props', () {
      expect(
        playlist.props,
        [playlist.id, playlist.title, playlist.members],
      );
    });
  });

  group('PlaylistPost', () {
    late PlaylistPost playlistPost;
    late Map<String, dynamic> playlistPostJson;

    setUp(() {
      playlistPost = const PlaylistPost(
        title: 'Playlist 1',
        members: ['1'],
      );
      playlistPostJson = {
        'title': 'Playlist 1',
        'members': ['1'],
      };
    });

    test('Constructor', () {
      const PlaylistPost playlistPost = PlaylistPost(
        title: 'Playlist 1',
        members: ['1'],
      );
      expect(
        playlistPost.title,
        'Playlist 1',
      );
      expect(
        playlistPost.members,
        ['1'],
      );
    });

    test('toJson', () {
      expect(
        playlistPost.toJson(),
        playlistPostJson,
      );
    });

    test('fromJson', () {
      expect(
        PlaylistPost.fromJson(playlistPostJson),
        playlistPost,
      );
    });

    test('json equality', () {
      expect(
        PlaylistPost.fromJson(playlistPost.toJson()),
        playlistPost,
      );
    });

    test('props', () {
      expect(
        playlistPost.props,
        [playlistPost.title, playlistPost.members],
      );
    });
  });
}
