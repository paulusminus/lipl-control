import 'package:freezed_annotation/freezed_annotation.dart';

part 'lyric_post.freezed.dart';
part 'lyric_post.g.dart';

@freezed
class LyricPost with _$LyricPost {
  const factory LyricPost({
    required String title,
    required List<List<String>> parts,
  }) = _LyricPost;

  factory LyricPost.fromJson(Map<String, Object?> json) =>
      _$LyricPostFromJson(json);
}
