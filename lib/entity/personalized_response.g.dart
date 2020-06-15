// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalized_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalizedResponse _$PersonalizedResponseFromJson(Map<String, dynamic> json) {
  return PersonalizedResponse(
    id: json['id'] as int,
    type: json['type'] as int,
    name: json['name'] as String,
    copywriter: json['copywriter'] as String,
    picUrl: json['picUrl'] as String,
    canDislike: json['canDislike'] as bool,
    trackNumberUpdateTime: json['trackNumberUpdateTime'] as int,
    playCount: json['playCount'] as int,
    trackCount: json['trackCount'] as int,
    alg: json['alg'] as String,
    highQuality: json['highQuality'] as bool,
  );
}

Map<String, dynamic> _$PersonalizedResponseToJson(
        PersonalizedResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'copywriter': instance.copywriter,
      'picUrl': instance.picUrl,
      'canDislike': instance.canDislike,
      'trackNumberUpdateTime': instance.trackNumberUpdateTime,
      'playCount': instance.playCount,
      'trackCount': instance.trackCount,
      'highQuality': instance.highQuality,
      'alg': instance.alg,
    };
