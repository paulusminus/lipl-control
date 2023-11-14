import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:lipl_model/src/credentials.dart';
import 'package:lipl_model/src/lipl_model_base.dart';

const usernameKey = 'username';
const passwordKey = 'password';
const isMobileKey = 'isMobile';
const lyricsKey = 'lyrics';
const playlistsKey = 'playlists';

class LiplPreferences extends Equatable {
  const LiplPreferences({
    // required this.username,
    // required this.password,
    required this.lyrics,
    required this.playlists,
    required this.credentials,
  });

  factory LiplPreferences.deserialize(String s) {
    final dynamic json = jsonDecode(s);
    return LiplPreferences(
      credentials: json[usernameKey] == null || json[passwordKey] == null
          ? null
          : Credentials(
              username: json[usernameKey], password: json[passwordKey]),
      // username: json[usernameKey],
      // password: json[passwordKey],
      lyrics: (json[lyricsKey] as List<dynamic>)
          .map((dynamic json) => Lyric.fromJson(json))
          .toList(),
      playlists: (json[playlistsKey] as List<dynamic>)
          .map((dynamic json) => Playlist.fromJson(json))
          .toList(),
    );
  }

  factory LiplPreferences.blank(bool isMobile) => LiplPreferences(
        // username: '',
        // password: '',
        credentials: null,
        lyrics: [],
        playlists: [],
      );

  // final String username;
  // final String password;
  final Credentials? credentials;
  final List<Lyric> lyrics;
  final List<Playlist> playlists;

  String serialize() => jsonEncode(
        <String, dynamic>{
          usernameKey: credentials?.username,
          passwordKey: credentials?.password,
          lyricsKey: lyrics.map((lyric) => lyric.toJson()).toList(),
          playlistsKey: playlists.map((playlist) => playlist.toJson()).toList(),
        },
      );

  LiplPreferences copyWith({
    // String? username,
    // String? password,
    Credentials? Function()? credentials,
    List<Lyric>? lyrics,
    List<Playlist>? playlists,
  }) =>
      LiplPreferences(
        // username: username ?? this.username,
        // password: password ?? this.password,
        credentials: credentials == null ? this.credentials : credentials(),
        lyrics: lyrics ?? this.lyrics,
        playlists: playlists ?? this.playlists,
      );

  @override
  List<Object?> get props => <Object?>[
        credentials?.username,
        credentials?.password,
        lyrics,
        playlists
      ];
}
