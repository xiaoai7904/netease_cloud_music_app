import 'package:json_annotation/json_annotation.dart';

part 'playlist_hot_response.g.dart';

// 热门歌单分类
@JsonSerializable()
class PlayListHotResponse {
  final PlaylistTag playlistTag;
  final bool activity;
  final int usedCount;
  final bool hot;
  final int position;
  final int category;
  final int createTime;
  final String name;
  final int id;
  final int type;

  PlayListHotResponse(
      {this.playlistTag, this.activity, this.usedCount, this.hot, this.position, this.category, this.createTime, this.id, this.name, this.type});

  factory PlayListHotResponse.fromJson(Map<String, dynamic> json) => _$PlayListHotResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlayListHotResponseToJson(this);
}

@JsonSerializable()
class PlaylistTag {
  final int id;
  final String name;
  final int category;
  final int usedCount;
  final int type;
  final int position;
  final int createTime;
  final int highQuality;
  final int highQualityPos;
  final int officialPos;

  PlaylistTag(
      {this.id, this.name, this.category, this.usedCount, this.type, this.position, this.createTime, this.highQuality, this.highQualityPos, this.officialPos});

  factory PlaylistTag.fromJson(Map<String, dynamic> json) => _$PlaylistTagFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistTagToJson(this);
}
