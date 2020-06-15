// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalized_dj_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalizedDjResponse _$PersonalizedDjResponseFromJson(
    Map<String, dynamic> json) {
  return PersonalizedDjResponse(
    id: json['id'] as int,
    type: json['type'] as int,
    name: json['name'] as String,
    copywriter: json['copywriter'] as String,
    picUrl: json['picUrl'] as String,
    canDislike: json['canDislike'] as bool,
    program: json['program'] == null
        ? null
        : PersonalizedDjProgram.fromJson(
            json['program'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PersonalizedDjResponseToJson(
        PersonalizedDjResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'copywriter': instance.copywriter,
      'picUrl': instance.picUrl,
      'canDislike': instance.canDislike,
      'program': instance.program,
    };

PersonalizedDjProgram _$PersonalizedDjProgramFromJson(
    Map<String, dynamic> json) {
  return PersonalizedDjProgram(
    mainSong: json['mainSong'] == null
        ? null
        : PersonalizedDjMainSong.fromJson(
            json['mainSong'] as Map<String, dynamic>),
    dj: json['dj'] == null
        ? null
        : PersonalizedDjDj.fromJson(json['dj'] as Map<String, dynamic>),
    subscribedCount: json['subscribedCount'] as int,
    listenerCount: json['listenerCount'] as int,
    name: json['name'] as String,
    createTime: json['createTime'] as int,
    description: json['description'] as String,
    userId: json['userId'] as int,
    channels: (json['channels'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PersonalizedDjProgramToJson(
        PersonalizedDjProgram instance) =>
    <String, dynamic>{
      'mainSong': instance.mainSong,
      'dj': instance.dj,
      'subscribedCount': instance.subscribedCount,
      'listenerCount': instance.listenerCount,
      'name': instance.name,
      'createTime': instance.createTime,
      'description': instance.description,
      'userId': instance.userId,
      'channels': instance.channels,
    };

PersonalizedDjMainSong _$PersonalizedDjMainSongFromJson(
    Map<String, dynamic> json) {
  return PersonalizedDjMainSong(
    id: json['id'] as int,
    bMusic: json['bMusic'] == null
        ? null
        : PersonalizedNewSongSongBmusic.fromJson(
            json['bMusic'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PersonalizedDjMainSongToJson(
        PersonalizedDjMainSong instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bMusic': instance.bMusic,
    };

PersonalizedDjDj _$PersonalizedDjDjFromJson(Map<String, dynamic> json) {
  return PersonalizedDjDj(
    followed: json['followed'] as bool,
    avatarUrl: json['avatarUrl'] as String,
    accountStatus: json['accountStatus'] as int,
    gender: json['gender'] as int,
    birthday: json['birthday'] as int,
    userId: json['userId'] as int,
    userType: json['userType'] as int,
    nickname: json['nickname'] as String,
    signature: json['signature'] as String,
    backgroundUrl: json['backgroundUrl'] as String,
    brand: json['brand'] as String,
  );
}

Map<String, dynamic> _$PersonalizedDjDjToJson(PersonalizedDjDj instance) =>
    <String, dynamic>{
      'followed': instance.followed,
      'avatarUrl': instance.avatarUrl,
      'accountStatus': instance.accountStatus,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'userId': instance.userId,
      'userType': instance.userType,
      'nickname': instance.nickname,
      'signature': instance.signature,
      'backgroundUrl': instance.backgroundUrl,
      'brand': instance.brand,
    };
