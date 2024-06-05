import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:lipl_model/lipl_model.dart';
import 'package:lipl_app_bloc/src/basic_authentication.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:logging/logging.dart';
import 'package:retrofit/retrofit.dart';

part 'lipl_rest_api.g.dart';

final logger = Logger('$LiplRestApi');

abstract class LiplRestApiInterface {
  Future<List<Lyric>> getLyrics();
  // Future<List<Summary>> getLyricSummaries();
  Future<void> postLyric(@Body() Lyric lyric);
  Future<void> deleteLyric(@Path() String id);
  Future<void> putLyric(@Path() String id, @Body() Lyric lyric);
  Future<List<Playlist>> getPlaylists();
  Future<List<Summary>> getPlaylistSummaries();
  Future<void> postPlaylist(@Body() Playlist playlist);
  Future<void> deletePlaylist(@Path() String id);
  Future<void> putPlaylist(@Path() String id, @Body() Playlist playlist);
}

LiplRestApi apiFromConfig({
  Credentials? credentials,
  Directory? directory,
}) {
  const String apiPrefix = String.fromEnvironment('API_PREFIX',
      defaultValue: 'https://lipl.paulmin.nl');
  logger.info('Prefix = $apiPrefix');

  final Dio dio = Dio();
  if (credentials != null) {
    logger.info('Adding basic authentication headers');
    dio.interceptors.add(basicAuthentication(credentials: credentials));
  }

  if (kIsWeb) {
    dio.options.baseUrl = "/lipl/api/v1/";
  } else {
    final options = CacheOptions(
      store:
          directory == null ? MemCacheStore() : HiveCacheStore(directory.path),
    );
    dio.options.baseUrl = '$apiPrefix/lipl/api/v1/';
    dio.interceptors.add(DioCacheInterceptor(options: options));
  }

  return LiplRestApi(dio);
}

@RestApi()
abstract class LiplRestApi implements LiplRestApiInterface {
  factory LiplRestApi(Dio dio, {String baseUrl}) = _LiplRestApi;

  @override
  @GET('lyric')
  Future<List<Lyric>> getLyrics();

  // @override
  // @GET('lyric')
  // Future<List<Summary>> getLyricSummaries();

  @override
  @POST('lyric')
  Future<void> postLyric(@Body() Lyric lyric);

  @override
  @DELETE('lyric/{id}')
  Future<void> deleteLyric(@Path() String id);

  @override
  @PUT('lyric/{id}')
  Future<void> putLyric(@Path() String id, @Body() Lyric lyric);

  @override
  @GET('playlist?full=true')
  Future<List<Playlist>> getPlaylists();

  @override
  @GET('playlist')
  Future<List<Summary>> getPlaylistSummaries();

  @override
  @POST('playlist')
  Future<void> postPlaylist(@Body() Playlist playlist);

  @override
  @DELETE('playlist/{id}')
  Future<void> deletePlaylist(@Path() String id);

  @override
  @PUT('playlist/{id}')
  Future<void> putPlaylist(@Path() String id, @Body() Playlist playlist);
}
