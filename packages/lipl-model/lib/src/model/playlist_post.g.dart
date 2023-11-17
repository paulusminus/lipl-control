// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaylistPostImpl _$$PlaylistPostImplFromJson(Map<String, dynamic> json) =>
    _$PlaylistPostImpl(
      title: json['title'] as String,
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PlaylistPostImplToJson(_$PlaylistPostImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'members': instance.members,
    };
