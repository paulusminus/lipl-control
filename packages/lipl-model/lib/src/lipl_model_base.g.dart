// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lipl_model_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
      id: json['id'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

Lyric _$LyricFromJson(Map<String, dynamic> json) => Lyric(
      id: json['id'] as String,
      title: json['title'] as String,
      parts: (json['parts'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
    );

Map<String, dynamic> _$LyricToJson(Lyric instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'parts': instance.parts,
    };

LyricPost _$LyricPostFromJson(Map<String, dynamic> json) => LyricPost(
      title: json['title'] as String,
      parts: (json['parts'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
    );

Map<String, dynamic> _$LyricPostToJson(LyricPost instance) => <String, dynamic>{
      'title': instance.title,
      'parts': instance.parts,
    };

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      id: json['id'] as String,
      title: json['title'] as String,
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'members': instance.members,
    };

PlaylistPost _$PlaylistPostFromJson(Map<String, dynamic> json) => PlaylistPost(
      title: json['title'] as String,
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PlaylistPostToJson(PlaylistPost instance) =>
    <String, dynamic>{
      'title': instance.title,
      'members': instance.members,
    };
