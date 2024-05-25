import 'dart:async';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lipl_model/lipl_model.dart';
import 'package:loading_status/loading_status.dart';
import 'package:logging/logging.dart';
import 'lipl_rest_api.dart';

part 'lipl_app_cubit.freezed.dart';
part 'lipl_app_cubit.g.dart';

final Logger logger = Logger('$LiplAppCubit');

@freezed
class LiplAppState with _$LiplAppState {
  const factory LiplAppState({
    @Default([]) List<Lyric> lyrics,
    @Default([]) List<Playlist> playlists,
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default(null) Credentials? credentials,
  }) = _LiplAppState;

  factory LiplAppState.fromJson(Map<String, Object?> json) =>
      _$LiplAppStateFromJson(json);
}

class LiplAppCubit extends HydratedCubit<LiplAppState> {
  LiplAppCubit({
    LiplRestApiInterface? api,
  }) : super(const LiplAppState()) {
    _api = api;
  }

  late LiplRestApiInterface? _api;

  @override
  LiplAppState fromJson(Map<String, dynamic> json) {
    return LiplAppState.fromJson(json['preferences']);
  }

  @override
  Map<String, dynamic> toJson(LiplAppState state) {
    return <String, LiplAppState>{'preferences': state};
  }

  Stream<List<Lyric>> get lyricsStream => stream
      .where((state) => state.status == LoadingStatus.success)
      .map((state) => state.lyrics);

  Stream<List<Playlist>> get playlistsStream => stream
      .where((state) => state.status == LoadingStatus.success)
      .map((state) => state.playlists);

  @override
  void onError(Object error, StackTrace stackTrace) {
    if (error is DioException) {
      if (error.response?.statusCode == 401) {
        emit(state.copyWith(status: LoadingStatus.unauthorized));
      }
    }
    super.onError(error, stackTrace);
  }

  Future<void> _runAsync(Future<void> Function() runnable) async {
    try {
      await runnable();
    } catch (error) {
      addError(error);
    }
  }

  void preferencesChanged(Credentials? credentials) {
    emit(state.copyWith(credentials: credentials));
  }

  Future<void> load() => _runAsync(() async {
        emit(
          state.copyWith(
            status: LoadingStatus.loading,
          ),
        );
        final api = _api ?? apiFromConfig(credentials: state.credentials);
        final (lyrics, playlists) =
            await (api.getLyrics(), api.getPlaylists()).wait;
        logger.info('Fetch lyrics and playlists succes');
        emit(
          state.copyWith(
            lyrics: lyrics.sortByTitle(),
            playlists: playlists.sortByTitle(),
            status: LoadingStatus.success,
          ),
        );
      });

  Future<void> postLyric(Lyric lyric) => _runAsync(() async {
        final api = _api ?? apiFromConfig(credentials: state.credentials);
        emit(state.copyWith(status: LoadingStatus.changing));
        if (lyric.id == null) {
          lyric = lyric.copyWith(id: newId());
        }
        await api.postLyric(lyric);
        logger.info('Posting new lyric with title ${lyric.title} successful');
        emit(
          state.copyWith(
            lyrics: state.lyrics.addItem(lyric),
            status: LoadingStatus.success,
          ),
        );
      });

  Future<void> putLyric(Lyric lyric) => _runAsync(() async {
        final api = _api ?? apiFromConfig(credentials: state.credentials);
        emit(state.copyWith(status: LoadingStatus.changing));
        await api.putLyric(lyric.id!, lyric);
        logger.info('Changing lyric with title ${lyric.title} successfull');
        emit(
          state.copyWith(
            lyrics: state.lyrics.replaceItem(lyric),
            status: LoadingStatus.success,
          ),
        );
      });

  Future<void> deleteLyric(String id) => _runAsync(() async {
        final api = _api ?? apiFromConfig(credentials: state.credentials);
        emit(state.copyWith(status: LoadingStatus.changing));
        await api.deleteLyric(id);
        logger.info('Deleting lyric with id $id successful');
        emit(
          state.copyWith(
            lyrics: state.lyrics.removeItemById(id),
            playlists: state.playlists
                .map((Playlist p) => p.withoutMember(id))
                .toList(),
            status: LoadingStatus.success,
          ),
        );
      });

  Future<void> postPlaylist(Playlist playlist) => _runAsync(() async {
        final api = _api ?? apiFromConfig(credentials: state.credentials);
        emit(state.copyWith(status: LoadingStatus.changing));
        if (playlist.id == null) {
          playlist = playlist.copyWith(id: newId());
        }
        await api.postPlaylist(playlist);
        logger
            .info('Posting new lyric with title ${playlist.title} successfull');
        emit(
          state.copyWith(
            playlists: state.playlists.addItem(playlist),
            status: LoadingStatus.success,
          ),
        );
      });

  Future<void> putPlaylist(Playlist playlist) => _runAsync(() async {
        final api = _api ?? apiFromConfig(credentials: state.credentials);
        emit(state.copyWith(status: LoadingStatus.changing));
        await api.putPlaylist(playlist.id!, playlist);
        logger.info('Changing lyric with title ${playlist.title} successfull');
        emit(
          state.copyWith(
            playlists: state.playlists.replaceItem(playlist),
            status: LoadingStatus.success,
          ),
        );
      });

  Future<void> deletePlaylist(String id) => _runAsync(() async {
        final api = _api ?? apiFromConfig(credentials: state.credentials);
        emit(state.copyWith(status: LoadingStatus.changing));
        await api.deletePlaylist(id);
        logger.info('Deleting playlist with id $id successfull');
        emit(
          state.copyWith(
            playlists: state.playlists.removeItemById(id),
            status: LoadingStatus.success,
          ),
        );
      });
}
