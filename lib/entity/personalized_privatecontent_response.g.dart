// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalized_privatecontent_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalizedPrivatecontentResponse _$PersonalizedPrivatecontentResponseFromJson(
    Map<String, dynamic> json) {
  return PersonalizedPrivatecontentResponse(
    id: json['id'] as int,
    url: json['url'] as String,
    picUrl: json['picUrl'] as String,
    sPicUrl: json['sPicUrl'] as String,
    type: json['type'] as int,
    copywriter: json['copywriter'] as String,
    name: json['name'] as String,
    alg: json['alg'] as String,
  );
}

Map<String, dynamic> _$PersonalizedPrivatecontentResponseToJson(
        PersonalizedPrivatecontentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'picUrl': instance.picUrl,
      'sPicUrl': instance.sPicUrl,
      'type': instance.type,
      'copywriter': instance.copywriter,
      'name': instance.name,
      'alg': instance.alg,
    };
