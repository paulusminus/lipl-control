// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lipl_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LiplPreferences _$LiplPreferencesFromJson(Map<String, dynamic> json) {
  return _LiplPreferences.fromJson(json);
}

/// @nodoc
mixin _$LiplPreferences {
  Credentials? get credentials => throw _privateConstructorUsedError;
  List<Lyric> get lyrics => throw _privateConstructorUsedError;
  List<Playlist> get playlists => throw _privateConstructorUsedError;

  /// Serializes this LiplPreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiplPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiplPreferencesCopyWith<LiplPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiplPreferencesCopyWith<$Res> {
  factory $LiplPreferencesCopyWith(
    LiplPreferences value,
    $Res Function(LiplPreferences) then,
  ) = _$LiplPreferencesCopyWithImpl<$Res, LiplPreferences>;
  @useResult
  $Res call({
    Credentials? credentials,
    List<Lyric> lyrics,
    List<Playlist> playlists,
  });

  $CredentialsCopyWith<$Res>? get credentials;
}

/// @nodoc
class _$LiplPreferencesCopyWithImpl<$Res, $Val extends LiplPreferences>
    implements $LiplPreferencesCopyWith<$Res> {
  _$LiplPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiplPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credentials = freezed,
    Object? lyrics = null,
    Object? playlists = null,
  }) {
    return _then(
      _value.copyWith(
            credentials:
                freezed == credentials
                    ? _value.credentials
                    : credentials // ignore: cast_nullable_to_non_nullable
                        as Credentials?,
            lyrics:
                null == lyrics
                    ? _value.lyrics
                    : lyrics // ignore: cast_nullable_to_non_nullable
                        as List<Lyric>,
            playlists:
                null == playlists
                    ? _value.playlists
                    : playlists // ignore: cast_nullable_to_non_nullable
                        as List<Playlist>,
          )
          as $Val,
    );
  }

  /// Create a copy of LiplPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CredentialsCopyWith<$Res>? get credentials {
    if (_value.credentials == null) {
      return null;
    }

    return $CredentialsCopyWith<$Res>(_value.credentials!, (value) {
      return _then(_value.copyWith(credentials: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LiplPreferencesImplCopyWith<$Res>
    implements $LiplPreferencesCopyWith<$Res> {
  factory _$$LiplPreferencesImplCopyWith(
    _$LiplPreferencesImpl value,
    $Res Function(_$LiplPreferencesImpl) then,
  ) = __$$LiplPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Credentials? credentials,
    List<Lyric> lyrics,
    List<Playlist> playlists,
  });

  @override
  $CredentialsCopyWith<$Res>? get credentials;
}

/// @nodoc
class __$$LiplPreferencesImplCopyWithImpl<$Res>
    extends _$LiplPreferencesCopyWithImpl<$Res, _$LiplPreferencesImpl>
    implements _$$LiplPreferencesImplCopyWith<$Res> {
  __$$LiplPreferencesImplCopyWithImpl(
    _$LiplPreferencesImpl _value,
    $Res Function(_$LiplPreferencesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LiplPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credentials = freezed,
    Object? lyrics = null,
    Object? playlists = null,
  }) {
    return _then(
      _$LiplPreferencesImpl(
        credentials:
            freezed == credentials
                ? _value.credentials
                : credentials // ignore: cast_nullable_to_non_nullable
                    as Credentials?,
        lyrics:
            null == lyrics
                ? _value._lyrics
                : lyrics // ignore: cast_nullable_to_non_nullable
                    as List<Lyric>,
        playlists:
            null == playlists
                ? _value._playlists
                : playlists // ignore: cast_nullable_to_non_nullable
                    as List<Playlist>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LiplPreferencesImpl extends _LiplPreferences {
  const _$LiplPreferencesImpl({
    this.credentials = null,
    final List<Lyric> lyrics = const [],
    final List<Playlist> playlists = const [],
  }) : _lyrics = lyrics,
       _playlists = playlists,
       super._();

  factory _$LiplPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiplPreferencesImplFromJson(json);

  @override
  @JsonKey()
  final Credentials? credentials;
  final List<Lyric> _lyrics;
  @override
  @JsonKey()
  List<Lyric> get lyrics {
    if (_lyrics is EqualUnmodifiableListView) return _lyrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lyrics);
  }

  final List<Playlist> _playlists;
  @override
  @JsonKey()
  List<Playlist> get playlists {
    if (_playlists is EqualUnmodifiableListView) return _playlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlists);
  }

  @override
  String toString() {
    return 'LiplPreferences(credentials: $credentials, lyrics: $lyrics, playlists: $playlists)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiplPreferencesImpl &&
            (identical(other.credentials, credentials) ||
                other.credentials == credentials) &&
            const DeepCollectionEquality().equals(other._lyrics, _lyrics) &&
            const DeepCollectionEquality().equals(
              other._playlists,
              _playlists,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    credentials,
    const DeepCollectionEquality().hash(_lyrics),
    const DeepCollectionEquality().hash(_playlists),
  );

  /// Create a copy of LiplPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiplPreferencesImplCopyWith<_$LiplPreferencesImpl> get copyWith =>
      __$$LiplPreferencesImplCopyWithImpl<_$LiplPreferencesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LiplPreferencesImplToJson(this);
  }
}

abstract class _LiplPreferences extends LiplPreferences {
  const factory _LiplPreferences({
    final Credentials? credentials,
    final List<Lyric> lyrics,
    final List<Playlist> playlists,
  }) = _$LiplPreferencesImpl;
  const _LiplPreferences._() : super._();

  factory _LiplPreferences.fromJson(Map<String, dynamic> json) =
      _$LiplPreferencesImpl.fromJson;

  @override
  Credentials? get credentials;
  @override
  List<Lyric> get lyrics;
  @override
  List<Playlist> get playlists;

  /// Create a copy of LiplPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiplPreferencesImplCopyWith<_$LiplPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
