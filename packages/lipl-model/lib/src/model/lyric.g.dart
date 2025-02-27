// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Lyric _$LyricFromJson(Map<String, dynamic> json) => _Lyric(
  id: json['id'] as String?,
  title: json['title'] as String,
  parts:
      (json['parts'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
);

Map<String, dynamic> _$LyricToJson(_Lyric instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'parts': instance.parts,
};
