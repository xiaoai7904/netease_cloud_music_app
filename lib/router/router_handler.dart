import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:netease_cloud_music_app/pages/mainApp/main_app.dart';
import 'package:netease_cloud_music_app/pages/notfound/not_found.dart';


// 首页
Handler homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MainApp();
});


//404页面
Handler notFound = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return NotFound();
});

