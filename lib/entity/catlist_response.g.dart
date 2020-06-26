// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catlist_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatlistResponse _$CatlistResponseFromJson(Map<String, dynamic> json) {
  return CatlistResponse(
    name: json['name'] as String,
    resourceCount: json['resourceCount'] as int,
    type: json['type'],
    category: json['category'] as int,
    resourceType: json['resourceType'] as int,
    hot: json['hot'] as bool,
    activity: json['activity'] as bool,
  );
}

Map<String, dynamic> _$CatlistResponseToJson(CatlistResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'resourceCount': instance.resourceCount,
      'type': instance.type,
      'category': instance.category,
      'resourceType': instance.resourceType,
      'hot': instance.hot,
      'activity': instance.activity,
    };
