import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:netease_cloud_music_app/pages/mainApp/main_app.dart';
import 'package:netease_cloud_music_app/pages/notfound/not_found.dart';
import 'package:netease_cloud_music_app/pages/songListPage/song_list_page.dart';
import 'package:netease_cloud_music_app/pages/songListPage/song_list_page_tag.dart';


// 首页
Handler homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MainApp();
});

// 歌单广场
Handler songListHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SongListPage();
});

// 歌单广场标签
Handler songListTagHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SongListPageTag();
});

//404页面
Handler notFound = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return NotFound();
});

