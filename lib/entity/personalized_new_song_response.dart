import 'package:json_annotation/json_annotation.dart';

part 'personalized_new_song_response.g.dart';

// 推荐歌曲列表
@JsonSerializable()
class PersonalizedNewSongResponse {
  final int id;
  final int type;
  // 歌曲名称
  final String name;
  // 歌曲背景图
  final String picUrl;
  final PersonalizedNewSongSong song;

  PersonalizedNewSongResponse({this.id, this.type,this.name,this.picUrl, this.song});

  factory PersonalizedNewSongResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedNewSongResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedNewSongResponseToJson(this);
}

@JsonSerializable()
class PersonalizedNewSongSong{
  final String name;
  final List<String> alias;
  final List<PersonalizedNewSongSongArtists> artists;
  final PersonalizedNewSongSongAlbum album;
  // 是否关注
  final bool statted;
  // 人气
  final int popularity;
  // 评分
  final int score;
  // 关注数
  final int starredNum;
  // 持续时间
  final int duration;
  // 播放次数
  final int playedNum;
  // 天播放次数
  final int dayPlays;
  // 歌曲信息
  final PersonalizedNewSongSongBmusic bMusic;
  
  PersonalizedNewSongSong({this.name, this.alias, this.artists, this.album, this.bMusic, this.dayPlays, this.duration, this.playedNum, this.popularity, this.score, this.starredNum, this.statted});

  factory PersonalizedNewSongSong.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedNewSongSongFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedNewSongSongToJson(this);

}


@JsonSerializable()
class PersonalizedNewSongSongArtists{
  final String name;
  final int id;
  final String picUrl;
  
  PersonalizedNewSongSongArtists({this.name, this.id, this.picUrl});

  factory PersonalizedNewSongSongArtists.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedNewSongSongArtistsFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedNewSongSongArtistsToJson(this);

}


@JsonSerializable()
class PersonalizedNewSongSongAlbum{
  final String name;
  final int id;
  final String type;
  final String picUrl;
  final int publishTime;
  final String description;
  final String tag;
  final String company;
  final String subType;

  PersonalizedNewSongSongAlbum({this.name, this.id, this.type, this.company, this.description, this.picUrl, this.publishTime, this.subType, this.tag});

  factory PersonalizedNewSongSongAlbum.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedNewSongSongAlbumFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedNewSongSongAlbumToJson(this);

}

@JsonSerializable()
class PersonalizedNewSongSongBmusic {
  final int id;
  // 歌曲大小
  final int size;
  // 歌曲类型
  final String extension;
  // 比特率
  final int bitrate;
  // 播放时长
  final int playTime;

  PersonalizedNewSongSongBmusic({this.id, this.size, this.extension, this.bitrate, this.playTime});

  factory PersonalizedNewSongSongBmusic.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedNewSongSongBmusicFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedNewSongSongBmusicToJson(this);
}