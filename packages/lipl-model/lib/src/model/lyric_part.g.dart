// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LyricPart _$LyricPartFromJson(Map<String, dynamic> json) => _LyricPart(
  current: (json['current'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  text: json['text'] as String,
  title: json['title'] as String,
);

Map<String, dynamic> _$LyricPartToJson(_LyricPart instance) =>
    <String, dynamic>{
      'current': instance.current,
      'total': instance.total,
      'text': instance.text,
      'title': instance.title,
    };
