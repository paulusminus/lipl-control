import 'package:freezed_annotation/freezed_annotation.dart';

part 'playlist_post.freezed.dart';
part 'playlist_post.g.dart';

@freezed
class PlaylistPost with _$PlaylistPost {
  const factory PlaylistPost({
    required String title,
    required List<String> members,
  }) = _PlaylistPost;

  factory PlaylistPost.fromJson(Map<String, Object?> json) =>
      _$PlaylistPostFromJson(json);
}
