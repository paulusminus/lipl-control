import 'package:lipl_model/lipl_model.dart';
import 'package:lipl_app_bloc/lipl_app_bloc.dart';

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
  Future<void> postLyric(Lyric post) {
    throw error;
  }

  @override
  Future<void> postPlaylist(Playlist post) {
    throw error;
  }

  @override
  Future<void> putLyric(String id, Lyric lyric) {
    throw error;
  }

  @override
  Future<void> putPlaylist(String id, Playlist playlist) {
    throw error;
  }
}

class InMemoryRestApi implements LiplRestApiInterface {
  InMemoryRestApi({required this.lyrics, required this.playlists});
  List<Lyric> lyrics = [];
  List<Playlist> playlists = [];

  @override
  deleteLyric(String id) async {
    lyrics = lyrics.removeItemById(id);
    playlists = playlists
        .map(
          (playlist) => playlist.copyWith(
            members: playlist.members.where((member) => member != id).toList(),
          ),
        )
        .toList();
  }

  @override
  deletePlaylist(String id) async {
    playlists = playlists.removeItemById(id);
  }

  @override
  getLyricSummaries() async => lyrics
      .map(
        (lyric) => Summary(id: lyric.id!, title: lyric.title),
      )
      .toList()
      .sortByTitle();

  @override
  getLyrics() async => lyrics.sortByTitle();

  @override
  getPlaylistSummaries() async => playlists
      .map(
        (playlist) => Summary(id: playlist.id!, title: playlist.title),
      )
      .toList()
      .sortByTitle();

  @override
  getPlaylists() async => playlists;

  @override
  postLyric(Lyric lyric) async {
    lyrics = [...lyrics, lyric].sortByTitle();
  }

  @override
  postPlaylist(Playlist playlist) async {
    playlists = [...playlists, playlist].sortByTitle();
  }

  @override
  putLyric(String id, Lyric lyric) async {
    lyrics.replaceItem(lyric);
  }

  @override
  putPlaylist(String id, Playlist playlist) async {
    playlists.replaceItem(playlist);
  }
}
