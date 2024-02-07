// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyric_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LyricPost _$LyricPostFromJson(Map<String, dynamic> json) {
  return _LyricPost.fromJson(json);
}

/// @nodoc
mixin _$LyricPost {
  String get title => throw _privateConstructorUsedError;
  List<List<String>> get parts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LyricPostCopyWith<LyricPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricPostCopyWith<$Res> {
  factory $LyricPostCopyWith(LyricPost value, $Res Function(LyricPost) then) =
      _$LyricPostCopyWithImpl<$Res, LyricPost>;
  @useResult
  $Res call({String title, List<List<String>> parts});
}

/// @nodoc
class _$LyricPostCopyWithImpl<$Res, $Val extends LyricPost>
    implements $LyricPostCopyWith<$Res> {
  _$LyricPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? parts = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      parts: null == parts
          ? _value.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LyricPostImplCopyWith<$Res>
    implements $LyricPostCopyWith<$Res> {
  factory _$$LyricPostImplCopyWith(
          _$LyricPostImpl value, $Res Function(_$LyricPostImpl) then) =
      __$$LyricPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<List<String>> parts});
}

/// @nodoc
class __$$LyricPostImplCopyWithImpl<$Res>
    extends _$LyricPostCopyWithImpl<$Res, _$LyricPostImpl>
    implements _$$LyricPostImplCopyWith<$Res> {
  __$$LyricPostImplCopyWithImpl(
      _$LyricPostImpl _value, $Res Function(_$LyricPostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? parts = null,
  }) {
    return _then(_$LyricPostImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      parts: null == parts
          ? _value._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LyricPostImpl implements _LyricPost {
  const _$LyricPostImpl(
      {required this.title, required final List<List<String>> parts})
      : _parts = parts;

  factory _$LyricPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$LyricPostImplFromJson(json);

  @override
  final String title;
  final List<List<String>> _parts;
  @override
  List<List<String>> get parts {
    if (_parts is EqualUnmodifiableListView) return _parts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parts);
  }

  @override
  String toString() {
    return 'LyricPost(title: $title, parts: $parts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LyricPostImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._parts, _parts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_parts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LyricPostImplCopyWith<_$LyricPostImpl> get copyWith =>
      __$$LyricPostImplCopyWithImpl<_$LyricPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LyricPostImplToJson(
      this,
    );
  }
}

abstract class _LyricPost implements LyricPost {
  const factory _LyricPost(
      {required final String title,
      required final List<List<String>> parts}) = _$LyricPostImpl;

  factory _LyricPost.fromJson(Map<String, dynamic> json) =
      _$LyricPostImpl.fromJson;

  @override
  String get title;
  @override
  List<List<String>> get parts;
  @override
  @JsonKey(ignore: true)
  _$$LyricPostImplCopyWith<_$LyricPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
