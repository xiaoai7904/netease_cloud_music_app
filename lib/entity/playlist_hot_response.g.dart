// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_hot_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayListHotResponse _$PlayListHotResponseFromJson(Map<String, dynamic> json) {
  return PlayListHotResponse(
    playlistTag: json['playlistTag'] == null
        ? null
        : PlaylistTag.fromJson(json['playlistTag'] as Map<String, dynamic>),
    activity: json['activity'] as bool,
    usedCount: json['usedCount'] as int,
    hot: json['hot'] as bool,
    position: json['position'] as int,
    category: json['category'] as int,
    createTime: json['createTime'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    type: json['type'] as int,
  );
}

Map<String, dynamic> _$PlayListHotResponseToJson(
        PlayListHotResponse instance) =>
    <String, dynamic>{
      'playlistTag': instance.playlistTag,
      'activity': instance.activity,
      'usedCount': instance.usedCount,
      'hot': instance.hot,
      'position': instance.position,
      'category': instance.category,
      'createTime': instance.createTime,
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
    };

PlaylistTag _$PlaylistTagFromJson(Map<String, dynamic> json) {
  return PlaylistTag(
    id: json['id'] as int,
    name: json['name'] as String,
    category: json['category'] as int,
    usedCount: json['usedCount'] as int,
    type: json['type'] as int,
    position: json['position'] as int,
    createTime: json['createTime'] as int,
    highQuality: json['highQuality'] as int,
    highQualityPos: json['highQualityPos'] as int,
    officialPos: json['officialPos'] as int,
  );
}

Map<String, dynamic> _$PlaylistTagToJson(PlaylistTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'usedCount': instance.usedCount,
      'type': instance.type,
      'position': instance.position,
      'createTime': instance.createTime,
      'highQuality': instance.highQuality,
      'highQualityPos': instance.highQualityPos,
      'officialPos': instance.officialPos,
    };
