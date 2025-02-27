// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_playlist_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditPlaylistState {

 bool get isNew; LoadingStatus get status; String get id; String get title; String get search; List<Lyric> get members; List<Lyric> get lyrics;
/// Create a copy of EditPlaylistState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditPlaylistStateCopyWith<EditPlaylistState> get copyWith => _$EditPlaylistStateCopyWithImpl<EditPlaylistState>(this as EditPlaylistState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditPlaylistState&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.status, status) || other.status == status)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.search, search) || other.search == search)&&const DeepCollectionEquality().equals(other.members, members)&&const DeepCollectionEquality().equals(other.lyrics, lyrics));
}


@override
int get hashCode => Object.hash(runtimeType,isNew,status,id,title,search,const DeepCollectionEquality().hash(members),const DeepCollectionEquality().hash(lyrics));

@override
String toString() {
  return 'EditPlaylistState(isNew: $isNew, status: $status, id: $id, title: $title, search: $search, members: $members, lyrics: $lyrics)';
}


}

/// @nodoc
abstract mixin class $EditPlaylistStateCopyWith<$Res>  {
  factory $EditPlaylistStateCopyWith(EditPlaylistState value, $Res Function(EditPlaylistState) _then) = _$EditPlaylistStateCopyWithImpl;
@useResult
$Res call({
 bool isNew, LoadingStatus status, String id, String title, String search, List<Lyric> members, List<Lyric> lyrics
});




}
/// @nodoc
class _$EditPlaylistStateCopyWithImpl<$Res>
    implements $EditPlaylistStateCopyWith<$Res> {
  _$EditPlaylistStateCopyWithImpl(this._self, this._then);

  final EditPlaylistState _self;
  final $Res Function(EditPlaylistState) _then;

/// Create a copy of EditPlaylistState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isNew = null,Object? status = null,Object? id = null,Object? title = null,Object? search = null,Object? members = null,Object? lyrics = null,}) {
  return _then(_self.copyWith(
isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadingStatus,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<Lyric>,lyrics: null == lyrics ? _self.lyrics : lyrics // ignore: cast_nullable_to_non_nullable
as List<Lyric>,
  ));
}

}


/// @nodoc


class _EditPlaylistState extends EditPlaylistState {
  const _EditPlaylistState({required this.isNew, this.status = LoadingStatus.initial, required this.id, this.title = '', this.search = '', final  List<Lyric> members = const [], final  List<Lyric> lyrics = const []}): _members = members,_lyrics = lyrics,super._();
  

@override final  bool isNew;
@override@JsonKey() final  LoadingStatus status;
@override final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String search;
 final  List<Lyric> _members;
@override@JsonKey() List<Lyric> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}

 final  List<Lyric> _lyrics;
@override@JsonKey() List<Lyric> get lyrics {
  if (_lyrics is EqualUnmodifiableListView) return _lyrics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lyrics);
}


/// Create a copy of EditPlaylistState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditPlaylistStateCopyWith<_EditPlaylistState> get copyWith => __$EditPlaylistStateCopyWithImpl<_EditPlaylistState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditPlaylistState&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.status, status) || other.status == status)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.search, search) || other.search == search)&&const DeepCollectionEquality().equals(other._members, _members)&&const DeepCollectionEquality().equals(other._lyrics, _lyrics));
}


@override
int get hashCode => Object.hash(runtimeType,isNew,status,id,title,search,const DeepCollectionEquality().hash(_members),const DeepCollectionEquality().hash(_lyrics));

@override
String toString() {
  return 'EditPlaylistState(isNew: $isNew, status: $status, id: $id, title: $title, search: $search, members: $members, lyrics: $lyrics)';
}


}

/// @nodoc
abstract mixin class _$EditPlaylistStateCopyWith<$Res> implements $EditPlaylistStateCopyWith<$Res> {
  factory _$EditPlaylistStateCopyWith(_EditPlaylistState value, $Res Function(_EditPlaylistState) _then) = __$EditPlaylistStateCopyWithImpl;
@override @useResult
$Res call({
 bool isNew, LoadingStatus status, String id, String title, String search, List<Lyric> members, List<Lyric> lyrics
});




}
/// @nodoc
class __$EditPlaylistStateCopyWithImpl<$Res>
    implements _$EditPlaylistStateCopyWith<$Res> {
  __$EditPlaylistStateCopyWithImpl(this._self, this._then);

  final _EditPlaylistState _self;
  final $Res Function(_EditPlaylistState) _then;

/// Create a copy of EditPlaylistState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isNew = null,Object? status = null,Object? id = null,Object? title = null,Object? search = null,Object? members = null,Object? lyrics = null,}) {
  return _then(_EditPlaylistState(
isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadingStatus,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<Lyric>,lyrics: null == lyrics ? _self._lyrics : lyrics // ignore: cast_nullable_to_non_nullable
as List<Lyric>,
  ));
}


}

// dart format on
