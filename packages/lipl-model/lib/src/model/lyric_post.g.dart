// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LyricPostImpl _$$LyricPostImplFromJson(Map<String, dynamic> json) =>
    _$LyricPostImpl(
      title: json['title'] as String,
      parts: (json['parts'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
    );

Map<String, dynamic> _$$LyricPostImplToJson(_$LyricPostImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'parts': instance.parts,
    };
