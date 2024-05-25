import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:lipl_model/lipl_model.dart';
import 'package:lipl_app_bloc/src/basic_authentication.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'lipl_rest_api.g.dart';

abstract class LiplRestApiInterface {
  Future<List<Lyric>> getLyrics();
  Future<List<Summary>> getLyricSummaries();
  Future<void> postLyric(@Body() Lyric lyric);
  Future<void> deleteLyric(@Path() String id);
  Future<void> putLyric(@Path() String id, @Body() Lyric lyric);
  Future<List<Playlist>> getPlaylists();
  Future<List<Summary>> getPlaylistSummaries();
  Future<void> postPlaylist(@Body() Playlist playlist);
  Future<void> deletePlaylist(@Path() String id);
  Future<Playlist> putPlaylist(@Path() String id, @Body() Playlist playlist);
}

LiplRestApi apiFromConfig({
  Credentials? credentials,
}) {
  final Dio dio = credentials == null
      ? Dio()
      : basicAuthenticationDio(
          credentials: credentials,
        );

  return kIsWeb
      ? LiplRestApi(dio, baseUrl: '/lipl/api/v1/')
      : LiplRestApi(dio, baseUrl: 'https://lipl.paulmin.nl/lipl/api/v1/');
}

@RestApi()
abstract class LiplRestApi implements LiplRestApiInterface {
  factory LiplRestApi(Dio dio, {String baseUrl}) = _LiplRestApi;

  @override
  @GET('lyric?full=true')
  Future<List<Lyric>> getLyrics();

  @override
  @GET('lyric')
  Future<List<Summary>> getLyricSummaries();

  @override
  @POST('lyric')
  Future<Lyric> postLyric(@Body() Lyric lyric);

  @override
  @DELETE('lyric/{id}')
  Future<void> deleteLyric(@Path() String id);

  @override
  @PUT('lyric/{id}')
  Future<Lyric> putLyric(@Path() String id, @Body() Lyric lyric);

  @override
  @GET('playlist?full=true')
  Future<List<Playlist>> getPlaylists();

  @override
  @GET('playlist')
  Future<List<Summary>> getPlaylistSummaries();

  @override
  @POST('playlist')
  Future<Playlist> postPlaylist(@Body() Playlist playlist);

  @override
  @DELETE('playlist/{id}')
  Future<void> deletePlaylist(@Path() String id);

  @override
  @PUT('playlist/{id}')
  Future<Playlist> putPlaylist(@Path() String id, @Body() Playlist playlist);
}
