// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) {
  return BannerResponse(
    pic: json['pic'] as String,
    targetId: json['targetId'] as int,
    targetType: json['targetType'] as int,
    titleColor: json['titleColor'] as String,
    typeTitle: json['typeTitle'] as String,
    url: json['url'] as String,
    bannerId: json['bannerId'] as String,
    song: json['song'] == null
        ? null
        : SongResponse.fromJson(json['song'] as Map<String, dynamic>),
    al: json['al'] == null
        ? null
        : AlResponse.fromJson(json['al'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BannerResponseToJson(BannerResponse instance) =>
    <String, dynamic>{
      'pic': instance.pic,
      'targetId': instance.targetId,
      'targetType': instance.targetType,
      'titleColor': instance.titleColor,
      'typeTitle': instance.typeTitle,
      'url': instance.url,
      'bannerId': instance.bannerId,
      'song': instance.song,
      'al': instance.al,
    };

SongResponse _$SongResponseFromJson(Map<String, dynamic> json) {
  return SongResponse(
    json['name'] as String,
    json['id'] as int,
    (json['ar'] as List)
        ?.map((e) =>
            e == null ? null : ArResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SongResponseToJson(SongResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'ar': instance.ar,
    };

AlResponse _$AlResponseFromJson(Map<String, dynamic> json) {
  return AlResponse(
    json['id'] as String,
    json['name'] as String,
    json['picUrl'] as String,
  );
}

Map<String, dynamic> _$AlResponseToJson(AlResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
    };

ArResponse _$ArResponseFromJson(Map<String, dynamic> json) {
  return ArResponse(
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$ArResponseToJson(ArResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
