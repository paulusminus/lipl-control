import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lipl_model_base.g.dart';

extension SortedList<T extends Summary> on List<T> {}

@JsonSerializable()
class Summary extends Equatable {
  const Summary({required this.id, required this.title});

  final String id;
  final String title;

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryToJson(this);

  @override
  String toString() => '$Summary: $title';

  @override
  List<Object?> get props => [id, title];
}

@JsonSerializable()
class Lyric extends Summary {
  const Lyric({required super.id, required super.title, required this.parts});
  final List<List<String>> parts;

  factory Lyric.fromJson(Map<String, dynamic> json) => _$LyricFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LyricToJson(this);

  Lyric copyWith({
    String Function()? title,
    List<List<String>> Function()? parts,
  }) =>
      Lyric(
        id: id,
        title: title == null ? this.title : title(),
        parts: parts == null ? this.parts : parts(),
      );

  @override
  String toString() {
    return '$Lyric: $title';
  }

  @override
  List<Object?> get props => [id, title, parts];
}

@JsonSerializable()
class LyricPost extends Equatable {
  const LyricPost({required this.title, required this.parts});
  final String title;
  final List<List<String>> parts;

  factory LyricPost.fromJson(Map<String, dynamic> json) =>
      _$LyricPostFromJson(json);

  Map<String, dynamic> toJson() => _$LyricPostToJson(this);

  @override
  List<Object?> get props => [title, parts];
}

@JsonSerializable()
class Playlist extends Summary {
  const Playlist(
      {required super.id, required super.title, required this.members});
  final List<String> members;

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PlaylistToJson(this);

  Playlist withoutMember(String id) => copyWith(
        members: members.where((element) => element != id).toList(),
      );

  Playlist copyWith({
    String? title,
    List<String>? members,
  }) =>
      Playlist(
        id: id,
        title: title ?? this.title,
        members: members ?? this.members,
      );

  @override
  String toString() {
    return '$Playlist: $title';
  }

  @override
  List<Object?> get props => [id, title, members];
}

@JsonSerializable()
class PlaylistPost extends Equatable {
  const PlaylistPost({required this.title, required this.members});
  final String title;
  final List<String> members;

  factory PlaylistPost.fromJson(Map<String, dynamic> json) =>
      _$PlaylistPostFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistPostToJson(this);

  @override
  List<Object?> get props => [title, members];
}
