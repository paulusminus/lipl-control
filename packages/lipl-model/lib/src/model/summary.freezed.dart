// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return _Summary.fromJson(json);
}

/// @nodoc
mixin _$Summary {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SummaryCopyWith<Summary> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryCopyWith<$Res> {
  factory $SummaryCopyWith(Summary value, $Res Function(Summary) then) =
      _$SummaryCopyWithImpl<$Res, Summary>;
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class _$SummaryCopyWithImpl<$Res, $Val extends Summary>
    implements $SummaryCopyWith<$Res> {
  _$SummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummaryImplCopyWith<$Res> implements $SummaryCopyWith<$Res> {
  factory _$$SummaryImplCopyWith(
          _$SummaryImpl value, $Res Function(_$SummaryImpl) then) =
      __$$SummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class __$$SummaryImplCopyWithImpl<$Res>
    extends _$SummaryCopyWithImpl<$Res, _$SummaryImpl>
    implements _$$SummaryImplCopyWith<$Res> {
  __$$SummaryImplCopyWithImpl(
      _$SummaryImpl _value, $Res Function(_$SummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$SummaryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$SummaryImpl extends _Summary {
  const _$SummaryImpl({required this.id, required this.title}) : super._();

  factory _$SummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryImplFromJson(json);

  @override
  final String id;
  @override
  final String title;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      __$$SummaryImplCopyWithImpl<_$SummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryImplToJson(
      this,
    );
  }
}

abstract class _Summary extends Summary {
  const factory _Summary(
      {required final String id, required final String title}) = _$SummaryImpl;
  const _Summary._() : super._();

  factory _Summary.fromJson(Map<String, dynamic> json) = _$SummaryImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
