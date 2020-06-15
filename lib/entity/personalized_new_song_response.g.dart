// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalized_new_song_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalizedNewSongResponse _$PersonalizedNewSongResponseFromJson(
    Map<String, dynamic> json) {
  return PersonalizedNewSongResponse(
    id: json['id'] as int,
    type: json['type'] as int,
    name: json['name'] as String,
    picUrl: json['picUrl'] as String,
    song: json['song'] == null
        ? null
        : PersonalizedNewSongSong.fromJson(
            json['song'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PersonalizedNewSongResponseToJson(
        PersonalizedNewSongResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'song': instance.song,
    };

PersonalizedNewSongSong _$PersonalizedNewSongSongFromJson(
    Map<String, dynamic> json) {
  return PersonalizedNewSongSong(
    name: json['name'] as String,
    alias: (json['alias'] as List)?.map((e) => e as String)?.toList(),
    artists: (json['artists'] as List)
        ?.map((e) => e == null
            ? null
            : PersonalizedNewSongSongArtists.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    album: json['album'] == null
        ? null
        : PersonalizedNewSongSongAlbum.fromJson(
            json['album'] as Map<String, dynamic>),
    bMusic: json['bMusic'] == null
        ? null
        : PersonalizedNewSongSongBmusic.fromJson(
            json['bMusic'] as Map<String, dynamic>),
    dayPlays: json['dayPlays'] as int,
    duration: json['duration'] as int,
    playedNum: json['playedNum'] as int,
    popularity: json['popularity'] as int,
    score: json['score'] as int,
    starredNum: json['starredNum'] as int,
    statted: json['statted'] as bool,
  );
}

Map<String, dynamic> _$PersonalizedNewSongSongToJson(
        PersonalizedNewSongSong instance) =>
    <String, dynamic>{
      'name': instance.name,
      'alias': instance.alias,
      'artists': instance.artists,
      'album': instance.album,
      'statted': instance.statted,
      'popularity': instance.popularity,
      'score': instance.score,
      'starredNum': instance.starredNum,
      'duration': instance.duration,
      'playedNum': instance.playedNum,
      'dayPlays': instance.dayPlays,
      'bMusic': instance.bMusic,
    };

PersonalizedNewSongSongArtists _$PersonalizedNewSongSongArtistsFromJson(
    Map<String, dynamic> json) {
  return PersonalizedNewSongSongArtists(
    name: json['name'] as String,
    id: json['id'] as int,
    picUrl: json['picUrl'] as String,
  );
}

Map<String, dynamic> _$PersonalizedNewSongSongArtistsToJson(
        PersonalizedNewSongSongArtists instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'picUrl': instance.picUrl,
    };

PersonalizedNewSongSongAlbum _$PersonalizedNewSongSongAlbumFromJson(
    Map<String, dynamic> json) {
  return PersonalizedNewSongSongAlbum(
    name: json['name'] as String,
    id: json['id'] as int,
    type: json['type'] as String,
    company: json['company'] as String,
    description: json['description'] as String,
    picUrl: json['picUrl'] as String,
    publishTime: json['publishTime'] as int,
    subType: json['subType'] as String,
    tag: json['tag'] as String,
  );
}

Map<String, dynamic> _$PersonalizedNewSongSongAlbumToJson(
        PersonalizedNewSongSongAlbum instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
      'picUrl': instance.picUrl,
      'publishTime': instance.publishTime,
      'description': instance.description,
      'tag': instance.tag,
      'company': instance.company,
      'subType': instance.subType,
    };

PersonalizedNewSongSongBmusic _$PersonalizedNewSongSongBmusicFromJson(
    Map<String, dynamic> json) {
  return PersonalizedNewSongSongBmusic(
    id: json['id'] as int,
    size: json['size'] as int,
    extension: json['extension'] as String,
    bitrate: json['bitrate'] as int,
    playTime: json['playTime'] as int,
  );
}

Map<String, dynamic> _$PersonalizedNewSongSongBmusicToJson(
        PersonalizedNewSongSongBmusic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'size': instance.size,
      'extension': instance.extension,
      'bitrate': instance.bitrate,
      'playTime': instance.playTime,
    };
