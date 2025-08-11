// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lipl_app_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiplAppState {

 List<Lyric> get lyrics; List<Playlist> get playlists; LoadingStatus get status; Credentials? get credentials; DateTime? get lastFetch;
/// Create a copy of LiplAppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiplAppStateCopyWith<LiplAppState> get copyWith => _$LiplAppStateCopyWithImpl<LiplAppState>(this as LiplAppState, _$identity);

  /// Serializes this LiplAppState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiplAppState&&const DeepCollectionEquality().equals(other.lyrics, lyrics)&&const DeepCollectionEquality().equals(other.playlists, playlists)&&(identical(other.status, status) || other.status == status)&&(identical(other.credentials, credentials) || other.credentials == credentials)&&(identical(other.lastFetch, lastFetch) || other.lastFetch == lastFetch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(lyrics),const DeepCollectionEquality().hash(playlists),status,credentials,lastFetch);

@override
String toString() {
  return 'LiplAppState(lyrics: $lyrics, playlists: $playlists, status: $status, credentials: $credentials, lastFetch: $lastFetch)';
}


}

/// @nodoc
abstract mixin class $LiplAppStateCopyWith<$Res>  {
  factory $LiplAppStateCopyWith(LiplAppState value, $Res Function(LiplAppState) _then) = _$LiplAppStateCopyWithImpl;
@useResult
$Res call({
 List<Lyric> lyrics, List<Playlist> playlists, LoadingStatus status, Credentials? credentials, DateTime? lastFetch
});


$CredentialsCopyWith<$Res>? get credentials;

}
/// @nodoc
class _$LiplAppStateCopyWithImpl<$Res>
    implements $LiplAppStateCopyWith<$Res> {
  _$LiplAppStateCopyWithImpl(this._self, this._then);

  final LiplAppState _self;
  final $Res Function(LiplAppState) _then;

/// Create a copy of LiplAppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lyrics = null,Object? playlists = null,Object? status = null,Object? credentials = freezed,Object? lastFetch = freezed,}) {
  return _then(_self.copyWith(
lyrics: null == lyrics ? _self.lyrics : lyrics // ignore: cast_nullable_to_non_nullable
as List<Lyric>,playlists: null == playlists ? _self.playlists : playlists // ignore: cast_nullable_to_non_nullable
as List<Playlist>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadingStatus,credentials: freezed == credentials ? _self.credentials : credentials // ignore: cast_nullable_to_non_nullable
as Credentials?,lastFetch: freezed == lastFetch ? _self.lastFetch : lastFetch // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of LiplAppState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CredentialsCopyWith<$Res>? get credentials {
    if (_self.credentials == null) {
    return null;
  }

  return $CredentialsCopyWith<$Res>(_self.credentials!, (value) {
    return _then(_self.copyWith(credentials: value));
  });
}
}


/// Adds pattern-matching-related methods to [LiplAppState].
extension LiplAppStatePatterns on LiplAppState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiplAppState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiplAppState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiplAppState value)  $default,){
final _that = this;
switch (_that) {
case _LiplAppState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiplAppState value)?  $default,){
final _that = this;
switch (_that) {
case _LiplAppState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Lyric> lyrics,  List<Playlist> playlists,  LoadingStatus status,  Credentials? credentials,  DateTime? lastFetch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiplAppState() when $default != null:
return $default(_that.lyrics,_that.playlists,_that.status,_that.credentials,_that.lastFetch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Lyric> lyrics,  List<Playlist> playlists,  LoadingStatus status,  Credentials? credentials,  DateTime? lastFetch)  $default,) {final _that = this;
switch (_that) {
case _LiplAppState():
return $default(_that.lyrics,_that.playlists,_that.status,_that.credentials,_that.lastFetch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Lyric> lyrics,  List<Playlist> playlists,  LoadingStatus status,  Credentials? credentials,  DateTime? lastFetch)?  $default,) {final _that = this;
switch (_that) {
case _LiplAppState() when $default != null:
return $default(_that.lyrics,_that.playlists,_that.status,_that.credentials,_that.lastFetch);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LiplAppState extends LiplAppState {
  const _LiplAppState({final  List<Lyric> lyrics = const [], final  List<Playlist> playlists = const [], this.status = LoadingStatus.initial, this.credentials = null, this.lastFetch = null}): _lyrics = lyrics,_playlists = playlists,super._();
  factory _LiplAppState.fromJson(Map<String, dynamic> json) => _$LiplAppStateFromJson(json);

 final  List<Lyric> _lyrics;
@override@JsonKey() List<Lyric> get lyrics {
  if (_lyrics is EqualUnmodifiableListView) return _lyrics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lyrics);
}

 final  List<Playlist> _playlists;
@override@JsonKey() List<Playlist> get playlists {
  if (_playlists is EqualUnmodifiableListView) return _playlists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_playlists);
}

@override@JsonKey() final  LoadingStatus status;
@override@JsonKey() final  Credentials? credentials;
@override@JsonKey() final  DateTime? lastFetch;

/// Create a copy of LiplAppState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiplAppStateCopyWith<_LiplAppState> get copyWith => __$LiplAppStateCopyWithImpl<_LiplAppState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiplAppStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiplAppState&&const DeepCollectionEquality().equals(other._lyrics, _lyrics)&&const DeepCollectionEquality().equals(other._playlists, _playlists)&&(identical(other.status, status) || other.status == status)&&(identical(other.credentials, credentials) || other.credentials == credentials)&&(identical(other.lastFetch, lastFetch) || other.lastFetch == lastFetch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_lyrics),const DeepCollectionEquality().hash(_playlists),status,credentials,lastFetch);

@override
String toString() {
  return 'LiplAppState(lyrics: $lyrics, playlists: $playlists, status: $status, credentials: $credentials, lastFetch: $lastFetch)';
}


}

/// @nodoc
abstract mixin class _$LiplAppStateCopyWith<$Res> implements $LiplAppStateCopyWith<$Res> {
  factory _$LiplAppStateCopyWith(_LiplAppState value, $Res Function(_LiplAppState) _then) = __$LiplAppStateCopyWithImpl;
@override @useResult
$Res call({
 List<Lyric> lyrics, List<Playlist> playlists, LoadingStatus status, Credentials? credentials, DateTime? lastFetch
});


@override $CredentialsCopyWith<$Res>? get credentials;

}
/// @nodoc
class __$LiplAppStateCopyWithImpl<$Res>
    implements _$LiplAppStateCopyWith<$Res> {
  __$LiplAppStateCopyWithImpl(this._self, this._then);

  final _LiplAppState _self;
  final $Res Function(_LiplAppState) _then;

/// Create a copy of LiplAppState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lyrics = null,Object? playlists = null,Object? status = null,Object? credentials = freezed,Object? lastFetch = freezed,}) {
  return _then(_LiplAppState(
lyrics: null == lyrics ? _self._lyrics : lyrics // ignore: cast_nullable_to_non_nullable
as List<Lyric>,playlists: null == playlists ? _self._playlists : playlists // ignore: cast_nullable_to_non_nullable
as List<Playlist>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadingStatus,credentials: freezed == credentials ? _self.credentials : credentials // ignore: cast_nullable_to_non_nullable
as Credentials?,lastFetch: freezed == lastFetch ? _self.lastFetch : lastFetch // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of LiplAppState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CredentialsCopyWith<$Res>? get credentials {
    if (_self.credentials == null) {
    return null;
  }

  return $CredentialsCopyWith<$Res>(_self.credentials!, (value) {
    return _then(_self.copyWith(credentials: value));
  });
}
}

// dart format on
