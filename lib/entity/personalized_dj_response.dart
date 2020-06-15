import 'package:json_annotation/json_annotation.dart';
import 'package:netease_cloud_music_app/entity/personalized_new_song_response.dart';

part 'personalized_dj_response.g.dart';

// 推荐电台
@JsonSerializable()
class PersonalizedDjResponse {
  final int id;
  final int type;
  final String name;
  final String copywriter;
  final String picUrl;
  final bool canDislike;
  final PersonalizedDjProgram program;

  PersonalizedDjResponse({this.id, this.type, this.name, this.copywriter, this.picUrl, this.canDislike, this.program});

  factory PersonalizedDjResponse.fromJson(Map<String, dynamic> json) => _$PersonalizedDjResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedDjResponseToJson(this);
}

@JsonSerializable()
class PersonalizedDjProgram {
  final PersonalizedDjMainSong mainSong;
  final PersonalizedDjDj dj;
  // 订阅数
  final int subscribedCount;
  // 听众数
  final int listenerCount;
  // 电台名称
  final String name;
  // 创建时间
  final int createTime;
  // 描述
  final String description;
  // 用户id
  final int userId;
  // 频道
  final List<String> channels;

  PersonalizedDjProgram(
      {this.mainSong, this.dj, this.subscribedCount, this.listenerCount, this.name, this.createTime, this.description, this.userId, this.channels});

  factory PersonalizedDjProgram.fromJson(Map<String, dynamic> json) => _$PersonalizedDjProgramFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedDjProgramToJson(this);
}

@JsonSerializable()
class PersonalizedDjMainSong {
  final int id;
  final PersonalizedNewSongSongBmusic bMusic;

  PersonalizedDjMainSong({this.id, this.bMusic});

  factory PersonalizedDjMainSong.fromJson(Map<String, dynamic> json) => _$PersonalizedDjMainSongFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedDjMainSongToJson(this);
}

// dj信息
@JsonSerializable()
class PersonalizedDjDj {
  // 是否关注
  final bool followed;
  // 头像图片地址
  final String avatarUrl;
  // 账号状态
  final int accountStatus;
  // 性别
  final int gender;
  // 生日
  final int birthday;
  // dj用户id
  final int userId;
  // dj用户类型
  final int userType;
  // dj用户名
  final String nickname;
  // dj 签名
  final String signature;
  // dj 背景图
  final String backgroundUrl;
  // 标签
  final String brand;

  PersonalizedDjDj({this.followed, this.avatarUrl, this.accountStatus, this.gender, this.birthday, this.userId, this.userType, this.nickname, this.signature, this.backgroundUrl, this.brand});

  factory PersonalizedDjDj.fromJson(Map<String, dynamic> json) => _$PersonalizedDjDjFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedDjDjToJson(this);
}
