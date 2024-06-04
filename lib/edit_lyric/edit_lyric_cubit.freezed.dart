// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_lyric_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditLyricState {
  bool get isNew => throw _privateConstructorUsedError;
  LoadingStatus get status => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditLyricStateCopyWith<EditLyricState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditLyricStateCopyWith<$Res> {
  factory $EditLyricStateCopyWith(
          EditLyricState value, $Res Function(EditLyricState) then) =
      _$EditLyricStateCopyWithImpl<$Res, EditLyricState>;
  @useResult
  $Res call(
      {bool isNew, LoadingStatus status, String id, String title, String text});
}

/// @nodoc
class _$EditLyricStateCopyWithImpl<$Res, $Val extends EditLyricState>
    implements $EditLyricStateCopyWith<$Res> {
  _$EditLyricStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNew = null,
    Object? status = null,
    Object? id = null,
    Object? title = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditLyricStateImplCopyWith<$Res>
    implements $EditLyricStateCopyWith<$Res> {
  factory _$$EditLyricStateImplCopyWith(_$EditLyricStateImpl value,
          $Res Function(_$EditLyricStateImpl) then) =
      __$$EditLyricStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isNew, LoadingStatus status, String id, String title, String text});
}

/// @nodoc
class __$$EditLyricStateImplCopyWithImpl<$Res>
    extends _$EditLyricStateCopyWithImpl<$Res, _$EditLyricStateImpl>
    implements _$$EditLyricStateImplCopyWith<$Res> {
  __$$EditLyricStateImplCopyWithImpl(
      _$EditLyricStateImpl _value, $Res Function(_$EditLyricStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNew = null,
    Object? status = null,
    Object? id = null,
    Object? title = null,
    Object? text = null,
  }) {
    return _then(_$EditLyricStateImpl(
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditLyricStateImpl extends _EditLyricState {
  const _$EditLyricStateImpl(
      {required this.isNew,
      this.status = LoadingStatus.initial,
      required this.id,
      required this.title,
      required this.text})
      : super._();

  @override
  final bool isNew;
  @override
  @JsonKey()
  final LoadingStatus status;
  @override
  final String id;
  @override
  final String title;
  @override
  final String text;

  @override
  String toString() {
    return 'EditLyricState(isNew: $isNew, status: $status, id: $id, title: $title, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditLyricStateImpl &&
            (identical(other.isNew, isNew) || other.isNew == isNew) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isNew, status, id, title, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditLyricStateImplCopyWith<_$EditLyricStateImpl> get copyWith =>
      __$$EditLyricStateImplCopyWithImpl<_$EditLyricStateImpl>(
          this, _$identity);
}

abstract class _EditLyricState extends EditLyricState {
  const factory _EditLyricState(
      {required final bool isNew,
      final LoadingStatus status,
      required final String id,
      required final String title,
      required final String text}) = _$EditLyricStateImpl;
  const _EditLyricState._() : super._();

  @override
  bool get isNew;
  @override
  LoadingStatus get status;
  @override
  String get id;
  @override
  String get title;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$EditLyricStateImplCopyWith<_$EditLyricStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
