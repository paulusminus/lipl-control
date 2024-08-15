// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lipl_app_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiplAppState _$LiplAppStateFromJson(Map<String, dynamic> json) {
  return _LiplAppState.fromJson(json);
}

/// @nodoc
mixin _$LiplAppState {
  List<Lyric> get lyrics => throw _privateConstructorUsedError;
  List<Playlist> get playlists => throw _privateConstructorUsedError;
  LoadingStatus get status => throw _privateConstructorUsedError;
  Credentials? get credentials => throw _privateConstructorUsedError;
  DateTime? get lastFetch => throw _privateConstructorUsedError;

  /// Serializes this LiplAppState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiplAppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiplAppStateCopyWith<LiplAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiplAppStateCopyWith<$Res> {
  factory $LiplAppStateCopyWith(
          LiplAppState value, $Res Function(LiplAppState) then) =
      _$LiplAppStateCopyWithImpl<$Res, LiplAppState>;
  @useResult
  $Res call(
      {List<Lyric> lyrics,
      List<Playlist> playlists,
      LoadingStatus status,
      Credentials? credentials,
      DateTime? lastFetch});

  $CredentialsCopyWith<$Res>? get credentials;
}

/// @nodoc
class _$LiplAppStateCopyWithImpl<$Res, $Val extends LiplAppState>
    implements $LiplAppStateCopyWith<$Res> {
  _$LiplAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiplAppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lyrics = null,
    Object? playlists = null,
    Object? status = null,
    Object? credentials = freezed,
    Object? lastFetch = freezed,
  }) {
    return _then(_value.copyWith(
      lyrics: null == lyrics
          ? _value.lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as List<Lyric>,
      playlists: null == playlists
          ? _value.playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      credentials: freezed == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Credentials?,
      lastFetch: freezed == lastFetch
          ? _value.lastFetch
          : lastFetch // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of LiplAppState
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
abstract class _$$LiplAppStateImplCopyWith<$Res>
    implements $LiplAppStateCopyWith<$Res> {
  factory _$$LiplAppStateImplCopyWith(
          _$LiplAppStateImpl value, $Res Function(_$LiplAppStateImpl) then) =
      __$$LiplAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Lyric> lyrics,
      List<Playlist> playlists,
      LoadingStatus status,
      Credentials? credentials,
      DateTime? lastFetch});

  @override
  $CredentialsCopyWith<$Res>? get credentials;
}

/// @nodoc
class __$$LiplAppStateImplCopyWithImpl<$Res>
    extends _$LiplAppStateCopyWithImpl<$Res, _$LiplAppStateImpl>
    implements _$$LiplAppStateImplCopyWith<$Res> {
  __$$LiplAppStateImplCopyWithImpl(
      _$LiplAppStateImpl _value, $Res Function(_$LiplAppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiplAppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lyrics = null,
    Object? playlists = null,
    Object? status = null,
    Object? credentials = freezed,
    Object? lastFetch = freezed,
  }) {
    return _then(_$LiplAppStateImpl(
      lyrics: null == lyrics
          ? _value._lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as List<Lyric>,
      playlists: null == playlists
          ? _value._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      credentials: freezed == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Credentials?,
      lastFetch: freezed == lastFetch
          ? _value.lastFetch
          : lastFetch // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiplAppStateImpl extends _LiplAppState {
  const _$LiplAppStateImpl(
      {final List<Lyric> lyrics = const [],
      final List<Playlist> playlists = const [],
      this.status = LoadingStatus.initial,
      this.credentials = null,
      this.lastFetch = null})
      : _lyrics = lyrics,
        _playlists = playlists,
        super._();

  factory _$LiplAppStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiplAppStateImplFromJson(json);

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
  @JsonKey()
  final LoadingStatus status;
  @override
  @JsonKey()
  final Credentials? credentials;
  @override
  @JsonKey()
  final DateTime? lastFetch;

  @override
  String toString() {
    return 'LiplAppState(lyrics: $lyrics, playlists: $playlists, status: $status, credentials: $credentials, lastFetch: $lastFetch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiplAppStateImpl &&
            const DeepCollectionEquality().equals(other._lyrics, _lyrics) &&
            const DeepCollectionEquality()
                .equals(other._playlists, _playlists) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.credentials, credentials) ||
                other.credentials == credentials) &&
            (identical(other.lastFetch, lastFetch) ||
                other.lastFetch == lastFetch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_lyrics),
      const DeepCollectionEquality().hash(_playlists),
      status,
      credentials,
      lastFetch);

  /// Create a copy of LiplAppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiplAppStateImplCopyWith<_$LiplAppStateImpl> get copyWith =>
      __$$LiplAppStateImplCopyWithImpl<_$LiplAppStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiplAppStateImplToJson(
      this,
    );
  }
}

abstract class _LiplAppState extends LiplAppState {
  const factory _LiplAppState(
      {final List<Lyric> lyrics,
      final List<Playlist> playlists,
      final LoadingStatus status,
      final Credentials? credentials,
      final DateTime? lastFetch}) = _$LiplAppStateImpl;
  const _LiplAppState._() : super._();

  factory _LiplAppState.fromJson(Map<String, dynamic> json) =
      _$LiplAppStateImpl.fromJson;

  @override
  List<Lyric> get lyrics;
  @override
  List<Playlist> get playlists;
  @override
  LoadingStatus get status;
  @override
  Credentials? get credentials;
  @override
  DateTime? get lastFetch;

  /// Create a copy of LiplAppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiplAppStateImplCopyWith<_$LiplAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
