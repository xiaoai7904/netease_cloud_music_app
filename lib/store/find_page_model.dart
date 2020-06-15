import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/api/api.dart';
import 'package:netease_cloud_music_app/entity/banner_response.dart';
import 'package:netease_cloud_music_app/entity/personalized_dj_response.dart';
import 'package:netease_cloud_music_app/entity/personalized_new_song_response.dart';
import 'package:netease_cloud_music_app/entity/personalized_privatecontent_response.dart';
import 'package:netease_cloud_music_app/entity/personalized_response.dart';
import 'package:netease_cloud_music_app/utils/request_utils.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// 发现页面数据模型
class FindPageModel extends ChangeNotifier {
  // banner数据
  static List<BannerResponse> _banners = [];
  // 推荐歌单
  static List<PersonalizedResponse> _personalized = [];
  // 推荐歌曲
  static List<PersonalizedNewSongResponse> _personalizedSong = [];
  // 转化歌曲列表数据
  static List<List<PersonalizedNewSongResponse>> _convertPersonalizedSong = [];
  // 推荐电台
  static List<PersonalizedDjResponse> _personalizedDj = [];
  // 独家推送
  static List<PersonalizedPrivatecontentResponse> _personalizedPrivatecontent = [];

  List<BannerResponse> get banners => _banners;
  List<PersonalizedResponse> get personalized => _personalized;
  List<PersonalizedNewSongResponse> get personalizedSong => _personalizedSong;
  List<List<PersonalizedNewSongResponse>> get convertPersonalizedSong => _convertPersonalizedSong;
  List<PersonalizedDjResponse> get personalizedDj => _personalizedDj;
  List<PersonalizedPrivatecontentResponse> get personalizedPrivatecontent => _personalizedPrivatecontent;

  void setBanners(List<BannerResponse> list) {
    _banners = list;
    notifyListeners();
  }

  void setPersonalized(List<PersonalizedResponse> list) {
    _personalized = list;
    notifyListeners();
  }

  void setPersonalizedSong(List<PersonalizedNewSongResponse> list) {
    _personalizedSong = list;
    notifyListeners();
  }

  void setPersonalizedDj(List<PersonalizedDjResponse> list) {
    _personalizedDj = list;
    notifyListeners();
  }

  void setPersonalizedPrivatecontent(List<PersonalizedPrivatecontentResponse> list) {
    _personalizedPrivatecontent = list;
    notifyListeners();
  }

  void setConvertPersonalizedSong(List<PersonalizedNewSongResponse> list) {
    // 计算列数
    int columnNum = (personalizedSong.length / 3).ceil();
    int index = 0;
    int j = 0;
    List<List<PersonalizedNewSongResponse>> newList = List.generate(columnNum, (_) => []);

    for (int i = 0; i < newList.length; i++) {
      j = 0;
      while (j <= 2) {
        if (personalizedSong.length >= (index + 1)) {
          newList[i].add(personalizedSong.elementAt(index));
          j++;
          index++;
        } else {
          break;
        }
      }
    }
    _convertPersonalizedSong = newList;
    notifyListeners();
  }

  // 获取banner数据
  static Future requestBannerList({BuildContext context, Map<String, int> params = const {'type': 2}}) async {
    Response bannerResult = await RequestUtil.doHttpPost(Api.banner, params);
    // 请求成功更新banner数据
    if (bannerResult.data['code'] == 200) {
      List<BannerResponse> _bannerResult = (bannerResult.data['banners'] as List<dynamic>).map((item) => BannerResponse.fromJson(item)).toList();
      Provider.of<FindPageModel>(context, listen: false).setBanners(_bannerResult);
    }
    return bannerResult;
  }

  // 获取推荐歌单
  static Future requestPersonalized({BuildContext context, Map<String, int> params = const {'type': 7}}) async {
    Response personalizedResult = await RequestUtil.doHttpPost(Api.personalized, params);
    if (personalizedResult.data['code'] == 200) {
      List<PersonalizedResponse> _personalizedResult =
          (personalizedResult.data['result'] as List<dynamic>).map((item) => PersonalizedResponse.fromJson(item)).toList();
      Provider.of<FindPageModel>(context, listen: false).setPersonalized(_personalizedResult);
    }
    return personalizedResult;
  }

  // 获取推荐歌曲
  static Future requestPersonalizedSong({BuildContext context}) async {
    Response personalizedSongResult = await RequestUtil.doHttpPost(Api.personalizedNewSong, {});
    if (personalizedSongResult.data['code'] == 200) {
      List<PersonalizedNewSongResponse> _personalizedSongResult =
          (personalizedSongResult.data['result'] as List<dynamic>).map((item) => PersonalizedNewSongResponse.fromJson(item)).toList();
      Provider.of<FindPageModel>(context, listen: false).setPersonalizedSong(_personalizedSongResult);
      Provider.of<FindPageModel>(context, listen: false).setConvertPersonalizedSong(_personalizedSongResult);
    }
    return personalizedSongResult;
  }

  // 获取推荐电台
  static Future requestPersonalizedDj({BuildContext context}) async {
    Response personalizedDjResult = await RequestUtil.doHttpPost(Api.personalizedDjprogram, {});
    if (personalizedDjResult.data['code'] == 200) {
      List<PersonalizedDjResponse> _personalizedDjResult =
          (personalizedDjResult.data['result'] as List<dynamic>).map((item) => PersonalizedDjResponse.fromJson(item)).toList();
      Provider.of<FindPageModel>(context, listen: false).setPersonalizedDj(_personalizedDjResult);
    }
    return personalizedDjResult;
  }

   // 独家推送
  static Future requestPersonalizedPrivatecontent({BuildContext context}) async {
    Response personalizedPrivatecontentResult = await RequestUtil.doHttpPost(Api.personalizedPrivatecontent, {});
    if (personalizedPrivatecontentResult.data['code'] == 200) {
      List<PersonalizedPrivatecontentResponse> _personalizedPrivatecontentResult =
          (personalizedPrivatecontentResult.data['result'] as List<dynamic>).map((item) => PersonalizedPrivatecontentResponse.fromJson(item)).toList();
      Provider.of<FindPageModel>(context, listen: false).setPersonalizedPrivatecontent(_personalizedPrivatecontentResult);
    }
    return personalizedPrivatecontentResult;
  }
}
