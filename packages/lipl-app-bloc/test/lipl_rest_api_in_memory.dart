import 'package:lipl_model/lipl_model.dart';
import 'package:lipl_app_bloc/lipl_app_bloc.dart';
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

class ExceptionsRestApi implements LiplRestApiInterface {
  ExceptionsRestApi(this.error);

  final Object error;

  @override
  Future<void> deleteLyric(String id) {
    throw error;
  }

  @override
  Future<void> deletePlaylist(String id) {
    throw error;
  }

  @override
  Future<List<Summary>> getLyricSummaries() {
    throw error;
  }

  @override
  Future<List<Lyric>> getLyrics() {
    throw error;
  }

  @override
  Future<List<Summary>> getPlaylistSummaries() {
    throw error;
  }

  @override
  Future<List<Playlist>> getPlaylists() {
    throw error;
  }

  @override
  Future<Lyric> postLyric(Lyric post) {
    throw error;
  }

  @override
  Future<Playlist> postPlaylist(Playlist post) {
    throw error;
  }

  @override
  Future<Lyric> putLyric(String id, Lyric lyric) {
    throw error;
  }

  @override
  Future<Playlist> putPlaylist(String id, Playlist playlist) {
    throw error;
  }
}

class InMemoryRestApi implements LiplRestApiInterface {
  InMemoryRestApi({required this.lyrics, required this.playlists});
  List<Lyric> lyrics = [];
  List<Playlist> playlists = [];

  @override
  Future<void> deleteLyric(String id) {
    lyrics = lyrics.removeItemById(id);
    playlists = playlists
        .map(
          (playlist) => playlist.copyWith(
            members: playlist.members.where((member) => member != id).toList(),
          ),
        )
        .toList();
    return Future.value();
  }

  @override
  Future<void> deletePlaylist(String id) {
    playlists = playlists.removeItemById(id);
    return Future.value();
  }

  @override
  Future<List<Summary>> getLyricSummaries() => Future.value(
        lyrics
            .map(
              (lyric) => Summary(id: lyric.id!, title: lyric.title),
            )
            .toList()
            .sortByTitle(),
      );

  @override
  Future<List<Lyric>> getLyrics() => Future.value(lyrics.sortByTitle());

  @override
  Future<List<Summary>> getPlaylistSummaries() => Future.value(
        playlists
            .map(
              (playlist) => Summary(id: playlist.id!, title: playlist.title),
            )
            .toList()
            .sortByTitle(),
      );

  @override
  Future<List<Playlist>> getPlaylists() => Future.value(playlists);

  @override
  Future<Lyric> postLyric(Lyric post) {
    lyrics = [...lyrics, post].sortByTitle();
    return Future.value(post);
  }

  @override
  Future<Playlist> postPlaylist(Playlist post) {
    final playlist = Playlist(
      id: newId(),
      title: post.title,
      members: post.members,
    );
    playlists = [...playlists, playlist];
    return Future.value(playlist);
  }

  @override
  Future<Lyric> putLyric(String id, Lyric lyric) {
    lyrics.replaceItem(lyric);
    return Future.value(lyric);
  }

  @override
  Future<Playlist> putPlaylist(String id, Playlist playlist) {
    playlists.replaceItem(playlist);
    return Future.value(playlist);
  }
}
