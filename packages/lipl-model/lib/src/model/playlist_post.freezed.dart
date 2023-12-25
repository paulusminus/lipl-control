// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaylistPost _$PlaylistPostFromJson(Map<String, dynamic> json) {
  return _PlaylistPost.fromJson(json);
}

/// @nodoc
mixin _$PlaylistPost {
  String get title => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaylistPostCopyWith<PlaylistPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistPostCopyWith<$Res> {
  factory $PlaylistPostCopyWith(
          PlaylistPost value, $Res Function(PlaylistPost) then) =
      _$PlaylistPostCopyWithImpl<$Res, PlaylistPost>;
  @useResult
  $Res call({String title, List<String> members});
}

/// @nodoc
class _$PlaylistPostCopyWithImpl<$Res, $Val extends PlaylistPost>
    implements $PlaylistPostCopyWith<$Res> {
  _$PlaylistPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaylistPostImplCopyWith<$Res>
    implements $PlaylistPostCopyWith<$Res> {
  factory _$$PlaylistPostImplCopyWith(
          _$PlaylistPostImpl value, $Res Function(_$PlaylistPostImpl) then) =
      __$$PlaylistPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<String> members});
}

/// @nodoc
class __$$PlaylistPostImplCopyWithImpl<$Res>
    extends _$PlaylistPostCopyWithImpl<$Res, _$PlaylistPostImpl>
    implements _$$PlaylistPostImplCopyWith<$Res> {
  __$$PlaylistPostImplCopyWithImpl(
      _$PlaylistPostImpl _value, $Res Function(_$PlaylistPostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? members = null,
  }) {
    return _then(_$PlaylistPostImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaylistPostImpl implements _PlaylistPost {
  const _$PlaylistPostImpl(
      {required this.title, required final List<String> members})
      : _members = members;

  factory _$PlaylistPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaylistPostImplFromJson(json);

  @override
  final String title;
  final List<String> _members;
  @override
  List<String> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'PlaylistPost(title: $title, members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistPostImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistPostImplCopyWith<_$PlaylistPostImpl> get copyWith =>
      __$$PlaylistPostImplCopyWithImpl<_$PlaylistPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaylistPostImplToJson(
      this,
    );
  }
}

abstract class _PlaylistPost implements PlaylistPost {
  const factory _PlaylistPost(
      {required final String title,
      required final List<String> members}) = _$PlaylistPostImpl;

  factory _PlaylistPost.fromJson(Map<String, dynamic> json) =
      _$PlaylistPostImpl.fromJson;

  @override
  String get title;
  @override
  List<String> get members;
  @override
  @JsonKey(ignore: true)
  _$$PlaylistPostImplCopyWith<_$PlaylistPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
