import 'package:json_annotation/json_annotation.dart';

part 'banner_response.g.dart';

// 发现页面banner
@JsonSerializable()
class BannerResponse {
  // banner背景图
  final String pic;
  final int targetId;
  final int targetType;
  // banner背景图tag标签颜色
  final String titleColor;
   // banner背景图tag标签名称
  final String typeTitle;
  // banner跳转web地址
  final String url;
  // bannerid
  final String bannerId;
  // 歌曲信息 歌手信息 专辑信息
  final SongResponse song;
  // 歌曲详情 名称 封面
  final AlResponse al;
  
  BannerResponse({this.pic, this.targetId,this.targetType,this.titleColor, this.typeTitle, this.url, this.bannerId, this.song, this.al});

  factory BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);
}



// 歌曲详情
@JsonSerializable()
class SongResponse {
  // 歌曲名称
  final String name;
  // 歌曲id
  final int id;
  // 演唱歌手
  final List<ArResponse> ar;

  SongResponse(this.name, this.id, this.ar);

   factory SongResponse.fromJson(Map<String, dynamic> json) =>
      _$SongResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SongResponseToJson(this);
}


// 歌曲详情
@JsonSerializable()
class AlResponse {
  // 专辑id
  final String id;
  // 专辑名字
  final String name;
  // 专辑封面
  final String picUrl;

  AlResponse(this.id, this.name, this.picUrl);

   factory AlResponse.fromJson(Map<String, dynamic> json) =>
      _$AlResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AlResponseToJson(this);
}

// 歌手详情
@JsonSerializable()
class ArResponse {
  // 歌手id
  final int id;
  // 歌手名字
  final String name;

  ArResponse(this.id, this.name);

   factory ArResponse.fromJson(Map<String, dynamic> json) =>
      _$ArResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArResponseToJson(this);
}