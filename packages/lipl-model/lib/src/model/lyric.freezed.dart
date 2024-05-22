// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Lyric _$LyricFromJson(Map<String, dynamic> json) {
  return _Lyric.fromJson(json);
}

/// @nodoc
mixin _$Lyric {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<List<String>> get parts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LyricCopyWith<Lyric> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricCopyWith<$Res> {
  factory $LyricCopyWith(Lyric value, $Res Function(Lyric) then) =
      _$LyricCopyWithImpl<$Res, Lyric>;
  @useResult
  $Res call({String? id, String title, List<List<String>> parts});
}

/// @nodoc
class _$LyricCopyWithImpl<$Res, $Val extends Lyric>
    implements $LyricCopyWith<$Res> {
  _$LyricCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? parts = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$LyricImplCopyWith<$Res> implements $LyricCopyWith<$Res> {
  factory _$$LyricImplCopyWith(
          _$LyricImpl value, $Res Function(_$LyricImpl) then) =
      __$$LyricImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String title, List<List<String>> parts});
}

/// @nodoc
class __$$LyricImplCopyWithImpl<$Res>
    extends _$LyricCopyWithImpl<$Res, _$LyricImpl>
    implements _$$LyricImplCopyWith<$Res> {
  __$$LyricImplCopyWithImpl(
      _$LyricImpl _value, $Res Function(_$LyricImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? parts = null,
  }) {
    return _then(_$LyricImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$LyricImpl extends _Lyric {
  const _$LyricImpl(
      {required this.id,
      required this.title,
      required final List<List<String>> parts})
      : _parts = parts,
        super._();

  factory _$LyricImpl.fromJson(Map<String, dynamic> json) =>
      _$$LyricImplFromJson(json);

  @override
  final String? id;
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LyricImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._parts, _parts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, const DeepCollectionEquality().hash(_parts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LyricImplCopyWith<_$LyricImpl> get copyWith =>
      __$$LyricImplCopyWithImpl<_$LyricImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LyricImplToJson(
      this,
    );
  }
}

abstract class _Lyric extends Lyric {
  const factory _Lyric(
      {required final String? id,
      required final String title,
      required final List<List<String>> parts}) = _$LyricImpl;
  const _Lyric._() : super._();

  factory _Lyric.fromJson(Map<String, dynamic> json) = _$LyricImpl.fromJson;

  @override
  String? get id;
  @override
  String get title;
  @override
  List<List<String>> get parts;
  @override
  @JsonKey(ignore: true)
  _$$LyricImplCopyWith<_$LyricImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
