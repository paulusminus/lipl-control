import 'package:freezed_annotation/freezed_annotation.dart';
import 'model.dart';

part 'lyric.freezed.dart';
part 'lyric.g.dart';

@freezed
abstract class Lyric with _$Lyric {
  const Lyric._();
  const factory Lyric({
    required String? id,
    required String title,
    required List<List<String>> parts,
  }) = _Lyric;

  factory Lyric.fromJson(Map<String, Object?> json) => _$LyricFromJson(json);

  List<LyricPart> toLyricParts() => parts.indexed
      .map((element) => LyricPart(
            title: title,
            current: element.$1 + 1,
            total: parts.length,
            text: element.$2.join('\n'),
          ))
      .toList();

  @override
  String toString() => 'Lyric: $title';
}
