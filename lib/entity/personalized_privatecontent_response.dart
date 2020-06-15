import 'package:json_annotation/json_annotation.dart';

part 'personalized_privatecontent_response.g.dart';

// 独家推送
@JsonSerializable()
class PersonalizedPrivatecontentResponse {
  final int id;
  final String url;
  final String picUrl;
  final String sPicUrl;
  final int type;
  final String copywriter;
  final String name;
  final String alg;
  
  PersonalizedPrivatecontentResponse({this.id, this.url,this.picUrl,this.sPicUrl, this.type, this.copywriter, this.name, this.alg});

  factory PersonalizedPrivatecontentResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedPrivatecontentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedPrivatecontentResponseToJson(this);
}