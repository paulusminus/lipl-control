import 'package:freezed_annotation/freezed_annotation.dart';

part 'lyric_part.freezed.dart';
part 'lyric_part.g.dart';

@freezed
class LyricPart with _$LyricPart {
  const factory LyricPart({
    required int current,
    required int total,
    required String text,
    required String title,
  }) = _LyricPart;

  factory LyricPart.fromJson(Map<String, Object?> json) =>
      _$LyricPartFromJson(json);
}
