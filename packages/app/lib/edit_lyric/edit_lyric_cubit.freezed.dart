// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_lyric_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditLyricState {

 bool get isNew; LoadingStatus get status; String get id; String get title; String get text;
/// Create a copy of EditLyricState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditLyricStateCopyWith<EditLyricState> get copyWith => _$EditLyricStateCopyWithImpl<EditLyricState>(this as EditLyricState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditLyricState&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.status, status) || other.status == status)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,isNew,status,id,title,text);

@override
String toString() {
  return 'EditLyricState(isNew: $isNew, status: $status, id: $id, title: $title, text: $text)';
}


}

/// @nodoc
abstract mixin class $EditLyricStateCopyWith<$Res>  {
  factory $EditLyricStateCopyWith(EditLyricState value, $Res Function(EditLyricState) _then) = _$EditLyricStateCopyWithImpl;
@useResult
$Res call({
 bool isNew, LoadingStatus status, String id, String title, String text
});




}
/// @nodoc
class _$EditLyricStateCopyWithImpl<$Res>
    implements $EditLyricStateCopyWith<$Res> {
  _$EditLyricStateCopyWithImpl(this._self, this._then);

  final EditLyricState _self;
  final $Res Function(EditLyricState) _then;

/// Create a copy of EditLyricState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isNew = null,Object? status = null,Object? id = null,Object? title = null,Object? text = null,}) {
  return _then(_self.copyWith(
isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadingStatus,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _EditLyricState extends EditLyricState {
  const _EditLyricState({required this.isNew, this.status = LoadingStatus.initial, required this.id, required this.title, required this.text}): super._();
  

@override final  bool isNew;
@override@JsonKey() final  LoadingStatus status;
@override final  String id;
@override final  String title;
@override final  String text;

/// Create a copy of EditLyricState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditLyricStateCopyWith<_EditLyricState> get copyWith => __$EditLyricStateCopyWithImpl<_EditLyricState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditLyricState&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.status, status) || other.status == status)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,isNew,status,id,title,text);

@override
String toString() {
  return 'EditLyricState(isNew: $isNew, status: $status, id: $id, title: $title, text: $text)';
}


}

/// @nodoc
abstract mixin class _$EditLyricStateCopyWith<$Res> implements $EditLyricStateCopyWith<$Res> {
  factory _$EditLyricStateCopyWith(_EditLyricState value, $Res Function(_EditLyricState) _then) = __$EditLyricStateCopyWithImpl;
@override @useResult
$Res call({
 bool isNew, LoadingStatus status, String id, String title, String text
});




}
/// @nodoc
class __$EditLyricStateCopyWithImpl<$Res>
    implements _$EditLyricStateCopyWith<$Res> {
  __$EditLyricStateCopyWithImpl(this._self, this._then);

  final _EditLyricState _self;
  final $Res Function(_EditLyricState) _then;

/// Create a copy of EditLyricState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isNew = null,Object? status = null,Object? id = null,Object? title = null,Object? text = null,}) {
  return _then(_EditLyricState(
isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadingStatus,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
