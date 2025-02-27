// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lipl_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiplPreferences {

 Credentials? get credentials; List<Lyric> get lyrics; List<Playlist> get playlists;
/// Create a copy of LiplPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiplPreferencesCopyWith<LiplPreferences> get copyWith => _$LiplPreferencesCopyWithImpl<LiplPreferences>(this as LiplPreferences, _$identity);

  /// Serializes this LiplPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiplPreferences&&(identical(other.credentials, credentials) || other.credentials == credentials)&&const DeepCollectionEquality().equals(other.lyrics, lyrics)&&const DeepCollectionEquality().equals(other.playlists, playlists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,credentials,const DeepCollectionEquality().hash(lyrics),const DeepCollectionEquality().hash(playlists));

@override
String toString() {
  return 'LiplPreferences(credentials: $credentials, lyrics: $lyrics, playlists: $playlists)';
}


}

/// @nodoc
abstract mixin class $LiplPreferencesCopyWith<$Res>  {
  factory $LiplPreferencesCopyWith(LiplPreferences value, $Res Function(LiplPreferences) _then) = _$LiplPreferencesCopyWithImpl;
@useResult
$Res call({
 Credentials? credentials, List<Lyric> lyrics, List<Playlist> playlists
});


$CredentialsCopyWith<$Res>? get credentials;

}
/// @nodoc
class _$LiplPreferencesCopyWithImpl<$Res>
    implements $LiplPreferencesCopyWith<$Res> {
  _$LiplPreferencesCopyWithImpl(this._self, this._then);

  final LiplPreferences _self;
  final $Res Function(LiplPreferences) _then;

/// Create a copy of LiplPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? credentials = freezed,Object? lyrics = null,Object? playlists = null,}) {
  return _then(_self.copyWith(
credentials: freezed == credentials ? _self.credentials : credentials // ignore: cast_nullable_to_non_nullable
as Credentials?,lyrics: null == lyrics ? _self.lyrics : lyrics // ignore: cast_nullable_to_non_nullable
as List<Lyric>,playlists: null == playlists ? _self.playlists : playlists // ignore: cast_nullable_to_non_nullable
as List<Playlist>,
  ));
}
/// Create a copy of LiplPreferences
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


/// @nodoc
@JsonSerializable()

class _LiplPreferences extends LiplPreferences {
  const _LiplPreferences({this.credentials = null, final  List<Lyric> lyrics = const [], final  List<Playlist> playlists = const []}): _lyrics = lyrics,_playlists = playlists,super._();
  factory _LiplPreferences.fromJson(Map<String, dynamic> json) => _$LiplPreferencesFromJson(json);

@override@JsonKey() final  Credentials? credentials;
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


/// Create a copy of LiplPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiplPreferencesCopyWith<_LiplPreferences> get copyWith => __$LiplPreferencesCopyWithImpl<_LiplPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiplPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiplPreferences&&(identical(other.credentials, credentials) || other.credentials == credentials)&&const DeepCollectionEquality().equals(other._lyrics, _lyrics)&&const DeepCollectionEquality().equals(other._playlists, _playlists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,credentials,const DeepCollectionEquality().hash(_lyrics),const DeepCollectionEquality().hash(_playlists));

@override
String toString() {
  return 'LiplPreferences(credentials: $credentials, lyrics: $lyrics, playlists: $playlists)';
}


}

/// @nodoc
abstract mixin class _$LiplPreferencesCopyWith<$Res> implements $LiplPreferencesCopyWith<$Res> {
  factory _$LiplPreferencesCopyWith(_LiplPreferences value, $Res Function(_LiplPreferences) _then) = __$LiplPreferencesCopyWithImpl;
@override @useResult
$Res call({
 Credentials? credentials, List<Lyric> lyrics, List<Playlist> playlists
});


@override $CredentialsCopyWith<$Res>? get credentials;

}
/// @nodoc
class __$LiplPreferencesCopyWithImpl<$Res>
    implements _$LiplPreferencesCopyWith<$Res> {
  __$LiplPreferencesCopyWithImpl(this._self, this._then);

  final _LiplPreferences _self;
  final $Res Function(_LiplPreferences) _then;

/// Create a copy of LiplPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? credentials = freezed,Object? lyrics = null,Object? playlists = null,}) {
  return _then(_LiplPreferences(
credentials: freezed == credentials ? _self.credentials : credentials // ignore: cast_nullable_to_non_nullable
as Credentials?,lyrics: null == lyrics ? _self._lyrics : lyrics // ignore: cast_nullable_to_non_nullable
as List<Lyric>,playlists: null == playlists ? _self._playlists : playlists // ignore: cast_nullable_to_non_nullable
as List<Playlist>,
  ));
}

/// Create a copy of LiplPreferences
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
