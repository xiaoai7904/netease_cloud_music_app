import 'package:json_annotation/json_annotation.dart';

part 'catlist_response.g.dart';

// 全部歌单分类
@JsonSerializable()
class CatlistResponse {
  final String name;
  final int resourceCount;
  final dynamic type;
  final int category;
  final int resourceType;
  final bool hot;
  final bool activity;
  
  CatlistResponse({this.name, this.resourceCount,this.type,this.category, this.resourceType, this.hot, this.activity});

  factory CatlistResponse.fromJson(Map<String, dynamic> json) =>
      _$CatlistResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CatlistResponseToJson(this);
}