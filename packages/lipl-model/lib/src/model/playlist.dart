import 'package:freezed_annotation/freezed_annotation.dart';

part 'playlist.freezed.dart';
part 'playlist.g.dart';

@freezed
abstract class Playlist with _$Playlist {
  const Playlist._();
  const factory Playlist({
    required String? id,
    required String title,
    required List<String> members,
  }) = _Playlist;

  factory Playlist.fromJson(Map<String, Object?> json) =>
      _$PlaylistFromJson(json);

  Playlist withoutMember(String id) =>
      copyWith(members: members.where((element) => element != id).toList());

  @override
  String toString() => '$Playlist: $title';
}
