// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LyricPartImpl _$$LyricPartImplFromJson(Map<String, dynamic> json) =>
    _$LyricPartImpl(
      current: json['current'] as int,
      total: json['total'] as int,
      text: json['text'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$LyricPartImplToJson(_$LyricPartImpl instance) =>
    <String, dynamic>{
      'current': instance.current,
      'total': instance.total,
      'text': instance.text,
      'title': instance.title,
    };
