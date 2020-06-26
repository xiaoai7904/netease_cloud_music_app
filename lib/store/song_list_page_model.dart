import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/api/api.dart';
import 'package:netease_cloud_music_app/entity/catlist_response.dart';
import 'package:netease_cloud_music_app/entity/playlist_hot_response.dart';
import 'package:netease_cloud_music_app/entity/top_play_list_response.dart';
import 'package:netease_cloud_music_app/utils/request_utils.dart';
import 'package:provider/provider.dart';

// 歌单广场页面数据模型
class SongListPageModel extends ChangeNotifier {
  // 我的歌单分类
  static List<PlayListHotResponse> _mySongList = [];
  // 热门歌单分类
  static List<PlayListHotResponse> _playlistHot = [];
  // 全部歌单分类
  static List<CatlistResponse> _catlist = [];
  // 对应歌单内容
  static List<Playlists> _topPlayList = [];
  // 精品歌单内容
  static List<Playlists> _topPlayListHighquality = [];
  // 精品歌单分类值
  static String _filterValue = '全部';
  // 精品歌单分类上一次值
  static String _oldFilterValue = '全部';

  List<PlayListHotResponse> get mySongList => _mySongList;
  List<PlayListHotResponse> get playlistHot => _playlistHot;
  List<CatlistResponse> get catlist => _catlist;
  List<Playlists> get topPlayList => _topPlayList;
  List<Playlists> get topPlayListHighquality => _topPlayListHighquality;
  String get filterValue => _filterValue;
  String get oldFilterValue => _oldFilterValue;

  void setMySongList(list) {
    _mySongList = list;
    // notifyListeners();
  }

  void setPlayListHot(list) {
    _playlistHot = list;
    notifyListeners();
  }

  void setTopPlayList(list) {
    _topPlayList = list;
    notifyListeners();
  }

  void setCatList(list) {
    _catlist = list;
    notifyListeners();
  }

  void setTopPlayListHighquality(list) {
    _topPlayListHighquality = list;
    notifyListeners();
  }

  void setFilterValue(list) {
    _oldFilterValue = _filterValue;
    _filterValue = list;
    notifyListeners();
  }

  void setOldFilterValue(list) {
    _oldFilterValue = list;
  }

  // 获取热门歌单分类数据
  static Future<Map<String, dynamic>> requestPlayListHotList({BuildContext context, Map<String, dynamic> params = const {}}) async {
    try {
      Response requestResult = await RequestUtil.doHttpPost(Api.playlistHot, params);
      if (requestResult.data['code'] == 200) {
        List<PlayListHotResponse> _result = (requestResult.data['tags'] as List<dynamic>).map((item) => PlayListHotResponse.fromJson(item)).toList();
        Provider.of<SongListPageModel>(context, listen: false).setPlayListHot(_result);
        // 重置精品歌单过滤值
        Provider.of<SongListPageModel>(context, listen: false).setFilterValue('全部');
        return {'requestResult': requestResult, 'list': _result};
      }
      return {'requestResult': requestResult, 'list': []};
    } catch (e) {
      return {'requestResult': {}, 'list': []};
    }
  }

  // 获取全部歌单分类数据
  static Future<Map<String, dynamic>> requestCatList({BuildContext context, Map<String, dynamic> params = const {}}) async {
    try {
      Response requestResult = await RequestUtil.doHttpPost(Api.catlist, params);
      if (requestResult.data['code'] == 200) {
        List<CatlistResponse> _result = (requestResult.data['sub'] as List<dynamic>).map((item) => CatlistResponse.fromJson(item)).toList();
        Provider.of<SongListPageModel>(context, listen: false).setCatList(_result);
        return {'requestResult': requestResult, 'list': _result};
      }
      return {'requestResult': requestResult, 'list': []};
    } catch (e) {
      return {'requestResult': {}, 'list': []};
    }
  }

  // 获取歌单内容数据
  static Future<Map<String, dynamic>> requestTopPlayList({BuildContext context, Map<String, dynamic> params = const {}}) async {
    try {
      Response requestResult = await RequestUtil.doHttpPost(Api.topPlayList, params);
      if (requestResult.data['code'] == 200) {
        List<Playlists> _result = (requestResult.data['playlists'] as List<dynamic>).map((item) => Playlists.fromJson(item)).toList();
        Provider.of<SongListPageModel>(context, listen: false).setTopPlayList(_result);
        return {'requestResult': requestResult, 'list': _result};
      }
      return {'requestResult': requestResult, 'list': []};
    } catch (e) {
      return {'requestResult': {}, 'list': []};
    }
  }

  // 获取精品歌单内容数据
  static Future<Map<String, dynamic>> requestTopPlayListHighquality({BuildContext context, Map<String, dynamic> params = const {}}) async {
    try {
      Response requestResult = await RequestUtil.doHttpPost(Api.topPlayListHighquality, params);
      if (requestResult.data['code'] == 200) {
        List<Playlists> _result = (requestResult.data['playlists'] as List<dynamic>).map((item) => Playlists.fromJson(item)).toList();
        Provider.of<SongListPageModel>(context, listen: false).setTopPlayListHighquality(_result);
        return {'requestResult': requestResult, 'list': _result};
      }
      return {'requestResult': requestResult, 'list': []};
    } catch (e) {
      return {'requestResult': {}, 'list': []};
    }
  }

  // 请求对应歌单数据
  static Function({int offset}) requestSongList({BuildContext context, int id, int limit, String name}) {
    Future<Map<String, dynamic>> request({int offset}) {
      // 精品歌单
      if (id == 999) {
        List<Playlists> topPlayListHighquality = Provider.of<SongListPageModel>(context, listen: false).topPlayListHighquality;
        var lastData = topPlayListHighquality.isEmpty ? null : topPlayListHighquality[topPlayListHighquality.length - 1];
        Map<String, dynamic> params = {'limit': limit, 'cat': _filterValue};

        if (offset != 0 && lastData != null) params.addAll({'before': lastData.updateTime});

        return SongListPageModel.requestTopPlayListHighquality(context: context, params: params);
      }
      // 推荐歌单
      if (id == 888) {
        Map<String, dynamic> params = {'order': 'hot', 'limit': limit, 'offset': (offset * limit)};
        return SongListPageModel.requestTopPlayList(context: context, params: params);
      }

      return SongListPageModel.requestTopPlayList(context: context, params: {'cat': name, 'limit': limit, 'offset': (offset * limit)});
    }

    return request;
  }

  // 初始化获取默认歌单分类
  static void getSongListTag({BuildContext context, List<PlayListHotResponse> boutique, Function(List<PlayListHotResponse>) updateTabValue}) async {
    List<PlayListHotResponse> mySongList = Provider.of<SongListPageModel>(context, listen: false).mySongList;
    Map<String, dynamic> playListHot = {};

    if (mySongList.isEmpty) {
      playListHot = await SongListPageModel.requestPlayListHotList(context: context);
      var list = boutique + playListHot['list'];
      Provider.of<SongListPageModel>(context, listen: false).setMySongList(list);
      updateTabValue(list);
    } else {
      updateTabValue(mySongList);
    }
  }
}
