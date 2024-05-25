// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_playlist_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditPlaylistState {
  LoadingStatus get status => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get search => throw _privateConstructorUsedError;
  List<Lyric> get members => throw _privateConstructorUsedError;
  List<Lyric> get lyrics => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditPlaylistStateCopyWith<EditPlaylistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditPlaylistStateCopyWith<$Res> {
  factory $EditPlaylistStateCopyWith(
          EditPlaylistState value, $Res Function(EditPlaylistState) then) =
      _$EditPlaylistStateCopyWithImpl<$Res, EditPlaylistState>;
  @useResult
  $Res call(
      {LoadingStatus status,
      String? id,
      String title,
      String search,
      List<Lyric> members,
      List<Lyric> lyrics});
}

/// @nodoc
class _$EditPlaylistStateCopyWithImpl<$Res, $Val extends EditPlaylistState>
    implements $EditPlaylistStateCopyWith<$Res> {
  _$EditPlaylistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? id = freezed,
    Object? title = null,
    Object? search = null,
    Object? members = null,
    Object? lyrics = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Lyric>,
      lyrics: null == lyrics
          ? _value.lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as List<Lyric>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditPlaylistStateImplCopyWith<$Res>
    implements $EditPlaylistStateCopyWith<$Res> {
  factory _$$EditPlaylistStateImplCopyWith(_$EditPlaylistStateImpl value,
          $Res Function(_$EditPlaylistStateImpl) then) =
      __$$EditPlaylistStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadingStatus status,
      String? id,
      String title,
      String search,
      List<Lyric> members,
      List<Lyric> lyrics});
}

/// @nodoc
class __$$EditPlaylistStateImplCopyWithImpl<$Res>
    extends _$EditPlaylistStateCopyWithImpl<$Res, _$EditPlaylistStateImpl>
    implements _$$EditPlaylistStateImplCopyWith<$Res> {
  __$$EditPlaylistStateImplCopyWithImpl(_$EditPlaylistStateImpl _value,
      $Res Function(_$EditPlaylistStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? id = freezed,
    Object? title = null,
    Object? search = null,
    Object? members = null,
    Object? lyrics = null,
  }) {
    return _then(_$EditPlaylistStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Lyric>,
      lyrics: null == lyrics
          ? _value._lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as List<Lyric>,
    ));
  }
}

/// @nodoc

class _$EditPlaylistStateImpl extends _EditPlaylistState {
  const _$EditPlaylistStateImpl(
      {this.status = LoadingStatus.initial,
      this.id = null,
      this.title = '',
      this.search = '',
      final List<Lyric> members = const [],
      final List<Lyric> lyrics = const []})
      : _members = members,
        _lyrics = lyrics,
        super._();

  @override
  @JsonKey()
  final LoadingStatus status;
  @override
  @JsonKey()
  final String? id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String search;
  final List<Lyric> _members;
  @override
  @JsonKey()
  List<Lyric> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<Lyric> _lyrics;
  @override
  @JsonKey()
  List<Lyric> get lyrics {
    if (_lyrics is EqualUnmodifiableListView) return _lyrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lyrics);
  }

  @override
  String toString() {
    return 'EditPlaylistState(status: $status, id: $id, title: $title, search: $search, members: $members, lyrics: $lyrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditPlaylistStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.search, search) || other.search == search) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other._lyrics, _lyrics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      id,
      title,
      search,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_lyrics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditPlaylistStateImplCopyWith<_$EditPlaylistStateImpl> get copyWith =>
      __$$EditPlaylistStateImplCopyWithImpl<_$EditPlaylistStateImpl>(
          this, _$identity);
}

abstract class _EditPlaylistState extends EditPlaylistState {
  const factory _EditPlaylistState(
      {final LoadingStatus status,
      final String? id,
      final String title,
      final String search,
      final List<Lyric> members,
      final List<Lyric> lyrics}) = _$EditPlaylistStateImpl;
  const _EditPlaylistState._() : super._();

  @override
  LoadingStatus get status;
  @override
  String? get id;
  @override
  String get title;
  @override
  String get search;
  @override
  List<Lyric> get members;
  @override
  List<Lyric> get lyrics;
  @override
  @JsonKey(ignore: true)
  _$$EditPlaylistStateImplCopyWith<_$EditPlaylistStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
