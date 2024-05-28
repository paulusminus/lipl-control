// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lipl_app_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiplAppStateImpl _$$LiplAppStateImplFromJson(Map<String, dynamic> json) =>
    _$LiplAppStateImpl(
      lyrics: (json['lyrics'] as List<dynamic>?)
              ?.map((e) => Lyric.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      playlists: (json['playlists'] as List<dynamic>?)
              ?.map((e) => Playlist.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      status: $enumDecodeNullable(_$LoadingStatusEnumMap, json['status']) ??
          LoadingStatus.initial,
      credentials: json['credentials'] == null
          ? null
          : Credentials.fromJson(json['credentials'] as Map<String, dynamic>),
      lastFetch: json['lastFetch'] == null
          ? null
          : DateTime.parse(json['lastFetch'] as String),
    );

Map<String, dynamic> _$$LiplAppStateImplToJson(_$LiplAppStateImpl instance) =>
    <String, dynamic>{
      'lyrics': instance.lyrics,
      'playlists': instance.playlists,
      'status': _$LoadingStatusEnumMap[instance.status]!,
      'credentials': instance.credentials,
      'lastFetch': instance.lastFetch?.toIso8601String(),
    };

const _$LoadingStatusEnumMap = {
  LoadingStatus.initial: 'initial',
  LoadingStatus.loading: 'loading',
  LoadingStatus.success: 'success',
  LoadingStatus.unauthorized: 'unauthorized',
  LoadingStatus.changing: 'changing',
  LoadingStatus.failure: 'failure',
};
