import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:lipl_model/lipl_model.dart';
import 'package:lipl_app_bloc/lipl_app_bloc.dart';
import 'package:dio/dio.dart';
import 'package:test/test.dart';

const baseUrl = 'https://www.paulmin.nl/lipl/api/v1/';

void main() {
  group('LiplRestApi', () {
    late Dio dio;
    late DioAdapter dioAdapter;
    late LiplRestApi restClient;

    setUp(() {
      dio = Dio();
      dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
      restClient = LiplRestApi(dio, baseUrl: baseUrl);
    });

    // test('get lyric summaries', () async {
    //   const getLyricSummariesResponse = [
    //     Summary(
    //       id: '2',
    //       title: 'Breng eens een zonnetje',
    //     ),
    //   ];

    //   dioAdapter.onGet(
    //     'lyric',
    //     (request) => request.reply(200, getLyricSummariesResponse),
    //     data: {},
    //   );

    //   final response = await restClient.getLyricSummaries();

    //   expect(getLyricSummariesResponse, response);
    // });

    test('get lyrics', () async {
      const getLyricsResponse = [
        Lyric(
          id: '1',
          title: 'Breng eens een zonnetje',
          parts: [
            [
              'Breng eens een zonnetje',
              'onder de mensen',
              'een blij gezicht te zien',
              'dat doet toch goed'
            ]
          ],
        )
      ];

      dioAdapter.onGet(
        'lyric',
        (request) => request.reply(200, getLyricsResponse),
        data: {},
      );

      final response = await restClient.getLyrics();
      expect(getLyricsResponse, response);
    });

    test('post lyric', () async {
      final payload = Lyric(
        id: newId(),
        title: 'Breng eens een zonnetje',
        parts: [
          [
            'Breng eens een zonnetje onder de mensen',
            'Een blij gezicht te zien dat doet toch goed',
          ],
        ],
      );

      dioAdapter.onPost(
        'lyric',
        (request) => request.reply(201, ''),
        data: payload.toJson(),
      );

      await restClient.postLyric(payload);
    });

    test('delete lyric', () async {
      const String id = '1';

      dioAdapter.onDelete(
        'lyric/$id',
        (request) => request.reply(204, {}),
        data: {},
      );

      await restClient.deleteLyric(id);
    });

    test('put lyric', () async {
      const payload = Lyric(
        id: '1',
        title: 'Breng eens een zonnetje',
        parts: [
          [
            'Breng eens een zonnetje onder de mensen',
            'Een blij gezicht te zien dat doet toch goed',
          ],
        ],
      );

      dioAdapter.onPut(
        'lyric/${payload.id}',
        (request) => request.reply(204, ''),
        data: payload.toJson(),
      );

      await restClient.putLyric('1', payload);
    });

    test('get playlist summaries', () async {
      const getPlaylistSummariesResponse = [
        Summary(id: '2', title: 'Alles'),
      ];

      dioAdapter.onGet(
        'playlist',
        (request) => request.reply(200, getPlaylistSummariesResponse),
        data: {},
      );

      final response = await restClient.getPlaylistSummaries();

      expect(getPlaylistSummariesResponse, response);
    });

    test('get playlists', () async {
      const getPlaylistsResponse = [
        Playlist(
          id: '1',
          title: 'Breng eens een zonnetje',
          members: [
            '1',
            '5',
            '6',
            '2',
          ],
        )
      ];

      dioAdapter.onGet(
        'playlist?full=true',
        (request) => request.reply(200, getPlaylistsResponse),
        data: {},
      );

      final response = await restClient.getPlaylists();
      expect(getPlaylistsResponse, response);
    });

    test('post playlist', () async {
      const payload = Playlist(
        id: null,
        title: 'Alles',
        members: [
          '56',
          '23',
        ],
      );

      dioAdapter.onPost(
        'playlist',
        (request) => request.reply(201, ''),
        data: payload.toJson(),
      );

      await restClient.postPlaylist(payload);
    });

    test('delete playlist', () async {
      const String id = '1';

      dioAdapter.onDelete(
        'playlist/$id',
        (request) => request.reply(204, {}),
        data: {},
      );

      await restClient.deletePlaylist(id);
    });

    test('put playlist', () async {
      const payload = Playlist(
        id: '1',
        title: 'Alles',
        members: [
          '45',
          '21',
        ],
      );

      dioAdapter.onPut(
        'playlist/${payload.id}',
        (request) => request.reply(204, ''),
        data: payload.toJson(),
      );

      await restClient.putPlaylist('1', payload);
    });
  });
}
