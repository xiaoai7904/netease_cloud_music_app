// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_play_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopPlayListResponse _$TopPlayListResponseFromJson(Map<String, dynamic> json) {
  return TopPlayListResponse(
    playlists: json['playlists'] == null
        ? null
        : Playlists.fromJson(json['playlists'] as Map<String, dynamic>),
    total: json['total'] as int,
    code: json['code'] as int,
    more: json['more'] as bool,
    cat: json['cat'] as String,
  );
}

Map<String, dynamic> _$TopPlayListResponseToJson(
        TopPlayListResponse instance) =>
    <String, dynamic>{
      'playlists': instance.playlists,
      'total': instance.total,
      'code': instance.code,
      'more': instance.more,
      'cat': instance.cat,
    };

Playlists _$PlaylistsFromJson(Map<String, dynamic> json) {
  return Playlists(
    adType: json['adType'] as int,
    alg: json['alg'] as String,
    anonimous: json['anonimous'] as bool,
    cloudTrackCount: json['cloudTrackCount'] as int,
    commentCount: json['commentCount'] as int,
    commentThreadId: json['commentThreadId'] as String,
    coverImgId: json['coverImgId'] as int,
    coverImgUrl: json['coverImgUrl'] as String,
    coverStatus: json['coverStatus'] as int,
    createTime: json['createTime'] as int,
    creator: json['creator'] == null
        ? null
        : Creator.fromJson(json['creator'] as Map<String, dynamic>),
    description: json['description'] as String,
    highQuality: json['highQuality'] as bool,
    id: json['id'] as int,
    name: json['name'] as String,
    newImported: json['newImported'] as bool,
    ordered: json['ordered'] as bool,
    playCount: json['playCount'] as int,
    privacy: json['privacy'] as int,
    recommendInfo: json['recommendInfo'],
    shareCount: json['shareCount'] as int,
    specialType: json['specialType'] as int,
    status: json['status'] as int,
    subscribed: json['subscribed'],
    subscribedCount: json['subscribedCount'] as int,
    subscribers: json['subscribers'] as List,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    totalDuration: json['totalDuration'] as int,
    trackCount: json['trackCount'] as int,
    trackNumberUpdateTime: json['trackNumberUpdateTime'] as int,
    trackUpdateTime: json['trackUpdateTime'] as int,
    tracks: json['tracks'],
    updateTime: json['updateTime'] as int,
    userId: json['userId'] as int,
  );
}

Map<String, dynamic> _$PlaylistsToJson(Playlists instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'trackNumberUpdateTime': instance.trackNumberUpdateTime,
      'status': instance.status,
      'userId': instance.userId,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'subscribedCount': instance.subscribedCount,
      'trackCount': instance.trackCount,
      'cloudTrackCount': instance.cloudTrackCount,
      'coverImgUrl': instance.coverImgUrl,
      'coverImgId': instance.coverImgId,
      'description': instance.description,
      'tags': instance.tags,
      'playCount': instance.playCount,
      'trackUpdateTime': instance.trackUpdateTime,
      'specialType': instance.specialType,
      'totalDuration': instance.totalDuration,
      'creator': instance.creator,
      'tracks': instance.tracks,
      'subscribers': instance.subscribers,
      'subscribed': instance.subscribed,
      'commentThreadId': instance.commentThreadId,
      'newImported': instance.newImported,
      'adType': instance.adType,
      'highQuality': instance.highQuality,
      'privacy': instance.privacy,
      'ordered': instance.ordered,
      'anonimous': instance.anonimous,
      'coverStatus': instance.coverStatus,
      'recommendInfo': instance.recommendInfo,
      'shareCount': instance.shareCount,
      'commentCount': instance.commentCount,
      'alg': instance.alg,
    };

Creator _$CreatorFromJson(Map<String, dynamic> json) {
  return Creator(
    defaultAvatar: json['defaultAvatar'] as bool,
    province: json['province'] as int,
    authStatus: json['authStatus'] as int,
    accountStatus: json['accountStatus'] as int,
    authority: json['authority'] as int,
    avatarImgId: json['avatarImgId'] as int,
    avatarImgIdStr: json['avatarImgIdStr'] as String,
    avatarUrl: json['avatarUrl'] as String,
    backgroundImgId: json['backgroundImgId'] as int,
    backgroundImgIdStr: json['backgroundImgIdStr'] as String,
    backgroundUrl: json['backgroundUrl'] as String,
    birthday: json['birthday'] as int,
    city: json['city'] as int,
    description: json['description'] as String,
    detailDescription: json['detailDescription'] as String,
    djStatus: json['djStatus'] as int,
    expertTags: json['expertTags'],
    experts: json['experts'],
    followed: json['followed'] as bool,
    gender: json['gender'] as int,
    mutual: json['mutual'] as bool,
    nickname: json['nickname'] as String,
    remarkName: json['remarkName'],
    signature: json['signature'] as String,
    userId: json['userId'] as int,
    userType: json['userType'] as int,
    vipType: json['vipType'] as int,
  );
}

Map<String, dynamic> _$CreatorToJson(Creator instance) => <String, dynamic>{
      'defaultAvatar': instance.defaultAvatar,
      'province': instance.province,
      'authStatus': instance.authStatus,
      'followed': instance.followed,
      'avatarUrl': instance.avatarUrl,
      'accountStatus': instance.accountStatus,
      'gender': instance.gender,
      'city': instance.city,
      'birthday': instance.birthday,
      'userId': instance.userId,
      'userType': instance.userType,
      'nickname': instance.nickname,
      'signature': instance.signature,
      'description': instance.description,
      'detailDescription': instance.detailDescription,
      'avatarImgId': instance.avatarImgId,
      'backgroundImgId': instance.backgroundImgId,
      'backgroundUrl': instance.backgroundUrl,
      'authority': instance.authority,
      'mutual': instance.mutual,
      'expertTags': instance.expertTags,
      'experts': instance.experts,
      'djStatus': instance.djStatus,
      'vipType': instance.vipType,
      'remarkName': instance.remarkName,
      'avatarImgIdStr': instance.avatarImgIdStr,
      'backgroundImgIdStr': instance.backgroundImgIdStr,
    };
