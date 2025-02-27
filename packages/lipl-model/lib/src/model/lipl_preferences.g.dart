// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lipl_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LiplPreferences _$LiplPreferencesFromJson(Map<String, dynamic> json) =>
    _LiplPreferences(
      credentials:
          json['credentials'] == null
              ? null
              : Credentials.fromJson(
                json['credentials'] as Map<String, dynamic>,
              ),
      lyrics:
          (json['lyrics'] as List<dynamic>?)
              ?.map((e) => Lyric.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      playlists:
          (json['playlists'] as List<dynamic>?)
              ?.map((e) => Playlist.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LiplPreferencesToJson(_LiplPreferences instance) =>
    <String, dynamic>{
      'credentials': instance.credentials?.toJson(),
      'lyrics': instance.lyrics.map((e) => e.toJson()).toList(),
      'playlists': instance.playlists.map((e) => e.toJson()).toList(),
    };
