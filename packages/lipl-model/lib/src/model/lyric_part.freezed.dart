// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyric_part.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LyricPart _$LyricPartFromJson(Map<String, dynamic> json) {
  return _LyricPart.fromJson(json);
}

/// @nodoc
mixin _$LyricPart {
  int get current => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LyricPartCopyWith<LyricPart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricPartCopyWith<$Res> {
  factory $LyricPartCopyWith(LyricPart value, $Res Function(LyricPart) then) =
      _$LyricPartCopyWithImpl<$Res, LyricPart>;
  @useResult
  $Res call({int current, int total, String text, String title});
}

/// @nodoc
class _$LyricPartCopyWithImpl<$Res, $Val extends LyricPart>
    implements $LyricPartCopyWith<$Res> {
  _$LyricPartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? total = null,
    Object? text = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LyricPartImplCopyWith<$Res>
    implements $LyricPartCopyWith<$Res> {
  factory _$$LyricPartImplCopyWith(
          _$LyricPartImpl value, $Res Function(_$LyricPartImpl) then) =
      __$$LyricPartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int current, int total, String text, String title});
}

/// @nodoc
class __$$LyricPartImplCopyWithImpl<$Res>
    extends _$LyricPartCopyWithImpl<$Res, _$LyricPartImpl>
    implements _$$LyricPartImplCopyWith<$Res> {
  __$$LyricPartImplCopyWithImpl(
      _$LyricPartImpl _value, $Res Function(_$LyricPartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? total = null,
    Object? text = null,
    Object? title = null,
  }) {
    return _then(_$LyricPartImpl(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LyricPartImpl implements _LyricPart {
  const _$LyricPartImpl(
      {required this.current,
      required this.total,
      required this.text,
      required this.title});

  factory _$LyricPartImpl.fromJson(Map<String, dynamic> json) =>
      _$$LyricPartImplFromJson(json);

  @override
  final int current;
  @override
  final int total;
  @override
  final String text;
  @override
  final String title;

  @override
  String toString() {
    return 'LyricPart(current: $current, total: $total, text: $text, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LyricPartImpl &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, current, total, text, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LyricPartImplCopyWith<_$LyricPartImpl> get copyWith =>
      __$$LyricPartImplCopyWithImpl<_$LyricPartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LyricPartImplToJson(
      this,
    );
  }
}

abstract class _LyricPart implements LyricPart {
  const factory _LyricPart(
      {required final int current,
      required final int total,
      required final String text,
      required final String title}) = _$LyricPartImpl;

  factory _LyricPart.fromJson(Map<String, dynamic> json) =
      _$LyricPartImpl.fromJson;

  @override
  int get current;
  @override
  int get total;
  @override
  String get text;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$LyricPartImplCopyWith<_$LyricPartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
