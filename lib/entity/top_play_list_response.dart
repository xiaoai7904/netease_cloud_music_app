import 'package:json_annotation/json_annotation.dart';

part 'top_play_list_response.g.dart';

// 对应歌单
@JsonSerializable()
class TopPlayListResponse {
  final Playlists playlists;
  final int total;
  final int code;
  final bool more;
  final String cat;

  TopPlayListResponse({this.playlists, this.total, this.code, this.more, this.cat});

  factory TopPlayListResponse.fromJson(Map<String, dynamic> json) => _$TopPlayListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopPlayListResponseToJson(this);
}

@JsonSerializable()
class Playlists {
  final String name;
  final int id;
  final int trackNumberUpdateTime;
  final int status;
  final int userId;
  final int createTime;
  final int updateTime;
  final int subscribedCount;
  final int trackCount;
  final int cloudTrackCount;
  final String coverImgUrl;
  final int coverImgId;
  final String description;
  final List<String> tags;
  final int playCount;
  final int trackUpdateTime;
  final int specialType;
  final int totalDuration;
  final Creator creator;
  final dynamic tracks;
  final List<dynamic> subscribers;
  final dynamic subscribed;
  final String commentThreadId;
  final bool newImported;
  final int adType;
  final bool highQuality;
  final int privacy;
  final bool ordered;
  final bool anonimous;
  final int coverStatus;
  final dynamic recommendInfo;
  final int shareCount;
  final int commentCount;
  final String alg;

  Playlists({
    this.adType,
    this.alg,
    this.anonimous,
    this.cloudTrackCount,
    this.commentCount,
    this.commentThreadId,
    this.coverImgId,
    this.coverImgUrl,
    this.coverStatus,
    this.createTime,
    this.creator,
    this.description,
    this.highQuality,
    this.id,
    this.name,
    this.newImported,
    this.ordered,
    this.playCount,
    this.privacy,
    this.recommendInfo,
    this.shareCount,
    this.specialType,
    this.status,
    this.subscribed,
    this.subscribedCount,
    this.subscribers,
    this.tags,
    this.totalDuration,
    this.trackCount,
    this.trackNumberUpdateTime,
    this.trackUpdateTime,
    this.tracks,
    this.updateTime,
    this.userId,
  });

  factory Playlists.fromJson(Map<String, dynamic> json) => _$PlaylistsFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistsToJson(this);
}

@JsonSerializable()
class Creator {
  final bool defaultAvatar;
  final int province;
  final int authStatus;
  final bool followed;
  final String avatarUrl;
  final int accountStatus;
  final int gender;
  final int city;
  final int birthday;
  final int userId;
  final int userType;
  final String nickname;
  final String signature;
  final String description;
  final String detailDescription;
  final int avatarImgId;
  final int backgroundImgId;
  final String backgroundUrl;
  final int authority;
  final bool mutual;
  final dynamic expertTags;
  final dynamic experts;
  final int djStatus;
  final int vipType;
  final dynamic remarkName;
  final String avatarImgIdStr;
  final String backgroundImgIdStr;

  Creator({
    this.defaultAvatar,
    this.province,
    this.authStatus,
    this.accountStatus,
    this.authority,
    this.avatarImgId,
    this.avatarImgIdStr,
    this.avatarUrl,
    this.backgroundImgId,
    this.backgroundImgIdStr,
    this.backgroundUrl,
    this.birthday,
    this.city,
    this.description,
    this.detailDescription,
    this.djStatus,
    this.expertTags,
    this.experts,
    this.followed,
    this.gender,
    this.mutual,
    this.nickname,
    this.remarkName,
    this.signature,
    this.userId,
    this.userType,
    this.vipType,
  });

  factory Creator.fromJson(Map<String, dynamic> json) => _$CreatorFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorToJson(this);
}
