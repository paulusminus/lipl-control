// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [EditLyricState].
extension EditLyricStatePatterns on EditLyricState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditLyricState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditLyricState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditLyricState value)  $default,){
final _that = this;
switch (_that) {
case _EditLyricState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditLyricState value)?  $default,){
final _that = this;
switch (_that) {
case _EditLyricState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isNew,  LoadingStatus status,  String id,  String title,  String text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditLyricState() when $default != null:
return $default(_that.isNew,_that.status,_that.id,_that.title,_that.text);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isNew,  LoadingStatus status,  String id,  String title,  String text)  $default,) {final _that = this;
switch (_that) {
case _EditLyricState():
return $default(_that.isNew,_that.status,_that.id,_that.title,_that.text);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isNew,  LoadingStatus status,  String id,  String title,  String text)?  $default,) {final _that = this;
switch (_that) {
case _EditLyricState() when $default != null:
return $default(_that.isNew,_that.status,_that.id,_that.title,_that.text);case _:
  return null;

}
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
