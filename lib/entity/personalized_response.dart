import 'package:json_annotation/json_annotation.dart';

part 'personalized_response.g.dart';

// 推荐歌单列表
@JsonSerializable()
class PersonalizedResponse {
  final int id;
  final int type;
  final String name;
  final String copywriter;
  final String picUrl;
  final bool canDislike;
  final int trackNumberUpdateTime;
  final int playCount;
  final int trackCount;
  final bool highQuality;
  final String alg;

  PersonalizedResponse({this.id, this.type,this.name,this.copywriter, this.picUrl, this.canDislike, this.trackNumberUpdateTime, this.playCount, this.trackCount, this.alg, this.highQuality});

  factory PersonalizedResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedResponseToJson(this);
}