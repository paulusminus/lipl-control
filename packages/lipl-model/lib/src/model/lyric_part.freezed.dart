// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyric_part.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LyricPart {

 int get current; int get total; String get text; String get title;
/// Create a copy of LyricPart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LyricPartCopyWith<LyricPart> get copyWith => _$LyricPartCopyWithImpl<LyricPart>(this as LyricPart, _$identity);

  /// Serializes this LyricPart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LyricPart&&(identical(other.current, current) || other.current == current)&&(identical(other.total, total) || other.total == total)&&(identical(other.text, text) || other.text == text)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,total,text,title);

@override
String toString() {
  return 'LyricPart(current: $current, total: $total, text: $text, title: $title)';
}


}

/// @nodoc
abstract mixin class $LyricPartCopyWith<$Res>  {
  factory $LyricPartCopyWith(LyricPart value, $Res Function(LyricPart) _then) = _$LyricPartCopyWithImpl;
@useResult
$Res call({
 int current, int total, String text, String title
});




}
/// @nodoc
class _$LyricPartCopyWithImpl<$Res>
    implements $LyricPartCopyWith<$Res> {
  _$LyricPartCopyWithImpl(this._self, this._then);

  final LyricPart _self;
  final $Res Function(LyricPart) _then;

/// Create a copy of LyricPart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = null,Object? total = null,Object? text = null,Object? title = null,}) {
  return _then(_self.copyWith(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LyricPart implements LyricPart {
  const _LyricPart({required this.current, required this.total, required this.text, required this.title});
  factory _LyricPart.fromJson(Map<String, dynamic> json) => _$LyricPartFromJson(json);

@override final  int current;
@override final  int total;
@override final  String text;
@override final  String title;

/// Create a copy of LyricPart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LyricPartCopyWith<_LyricPart> get copyWith => __$LyricPartCopyWithImpl<_LyricPart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LyricPartToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LyricPart&&(identical(other.current, current) || other.current == current)&&(identical(other.total, total) || other.total == total)&&(identical(other.text, text) || other.text == text)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,total,text,title);

@override
String toString() {
  return 'LyricPart(current: $current, total: $total, text: $text, title: $title)';
}


}

/// @nodoc
abstract mixin class _$LyricPartCopyWith<$Res> implements $LyricPartCopyWith<$Res> {
  factory _$LyricPartCopyWith(_LyricPart value, $Res Function(_LyricPart) _then) = __$LyricPartCopyWithImpl;
@override @useResult
$Res call({
 int current, int total, String text, String title
});




}
/// @nodoc
class __$LyricPartCopyWithImpl<$Res>
    implements _$LyricPartCopyWith<$Res> {
  __$LyricPartCopyWithImpl(this._self, this._then);

  final _LyricPart _self;
  final $Res Function(_LyricPart) _then;

/// Create a copy of LyricPart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = null,Object? total = null,Object? text = null,Object? title = null,}) {
  return _then(_LyricPart(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
