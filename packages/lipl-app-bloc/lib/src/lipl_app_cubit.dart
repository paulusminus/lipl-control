import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lipl_model/lipl_model.dart';
import 'package:loading_status/loading_status.dart';
import 'lipl_rest_api.dart';

part 'lipl_app_cubit.freezed.dart';

@freezed
class LiplAppState with _$LiplAppState {
  const factory LiplAppState({
    @Default([]) List<Lyric> lyrics,
    @Default([]) List<Playlist> playlists,
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default(null) Credentials? credentials,
  }) = _LiplAppState;
}

class LiplAppCubit extends Cubit<LiplAppState> {
  LiplAppCubit({
    required this.credentialsStream,
    required this.isWeb,
    LiplRestApiInterface? api,
  }) : super(const LiplAppState()) {
    _api = api;
    _subscription = credentialsStream.listen((credentials) {
      emit(state.copyWith(credentials: credentials));
      load();
    });
  }

  late StreamSubscription<Credentials?> _subscription;
  late LiplRestApiInterface? _api;
  bool isWeb;

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  Stream<Credentials?> credentialsStream;

  Stream<List<Lyric>> get lyricsStream => stream
      .where((state) => state.status == LoadingStatus.success)
      .map((state) => state.lyrics)
      .distinct();

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

  Future<void> load() => _runAsync(() async {
        emit(
          state.copyWith(
            status: LoadingStatus.loading,
          ),
        );
        List<Lyric> lyrics = [];
        List<Playlist> playlists = [];
        final api =
            _api ?? apiFromConfig(credentials: state.credentials, isWeb: isWeb);
        await Future.wait<void>(
          [
            api.getLyrics().then((value) {
              lyrics = value;
            }),
            api.getPlaylists().then((value) {
              playlists = value;
            }),
          ],
        );
        emit(
          state.copyWith(
            lyrics: lyrics.sortByTitle(),
            playlists: playlists.sortByTitle(),
            status: LoadingStatus.success,
          ),
        );
      });

  Future<void> postLyric(Lyric lyricPost) => _runAsync(() async {
        final api =
            _api ?? apiFromConfig(credentials: state.credentials, isWeb: isWeb);
        emit(state.copyWith(status: LoadingStatus.changing));
        if (lyricPost.id == null) {
          lyricPost = lyricPost.copyWith(id: newId());
        }
        final lyric = await api.postLyric(lyricPost);
        emit(
          state.copyWith(
            lyrics: state.lyrics.addItem(lyric),
            status: LoadingStatus.success,
          ),
        );
      });

  Future<void> putLyric(Lyric lyric) => _runAsync(() async {
        final api =
            _api ?? apiFromConfig(credentials: state.credentials, isWeb: isWeb);
        emit(state.copyWith(status: LoadingStatus.changing));
        await api.putLyric(lyric.id!, lyric);
        emit(
          state.copyWith(
            lyrics: state.lyrics.replaceItem(lyric),
            status: LoadingStatus.success,
          ),
        );
      });

  Future<void> deleteLyric(String id) => _runAsync(() async {
        final api =
            _api ?? apiFromConfig(credentials: state.credentials, isWeb: isWeb);
        emit(state.copyWith(status: LoadingStatus.changing));
        await api.deleteLyric(id);
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

  Future<void> postPlaylist(Playlist playlistPost) => _runAsync(() async {
        final api =
            _api ?? apiFromConfig(credentials: state.credentials, isWeb: isWeb);
        emit(state.copyWith(status: LoadingStatus.changing));
        if (playlistPost.id == null) {
          playlistPost = playlistPost.copyWith(id: newId());
        }
        final playlist = await api.postPlaylist(playlistPost);
        emit(
          state.copyWith(
            playlists: state.playlists.addItem(playlist),
            status: LoadingStatus.success,
          ),
        );
      });

  Future<void> putPlaylist(Playlist playlist) => _runAsync(() async {
        final api =
            _api ?? apiFromConfig(credentials: state.credentials, isWeb: isWeb);
        emit(state.copyWith(status: LoadingStatus.changing));
        await api.putPlaylist(playlist.id!, playlist);
        emit(
          state.copyWith(
            playlists: state.playlists.replaceItem(playlist),
            status: LoadingStatus.success,
          ),
        );
      });

  Future<void> deletePlaylist(String id) => _runAsync(() async {
        final api =
            _api ?? apiFromConfig(credentials: state.credentials, isWeb: isWeb);
        emit(state.copyWith(status: LoadingStatus.changing));
        await api.deletePlaylist(id);
        emit(
          state.copyWith(
            playlists: state.playlists.removeItemById(id),
            status: LoadingStatus.success,
          ),
        );
      });
}
