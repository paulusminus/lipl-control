// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LyricImpl _$$LyricImplFromJson(Map<String, dynamic> json) => _$LyricImpl(
      id: json['id'] as String?,
      title: json['title'] as String,
      parts: (json['parts'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
    );

Map<String, dynamic> _$$LyricImplToJson(_$LyricImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'parts': instance.parts,
    };
