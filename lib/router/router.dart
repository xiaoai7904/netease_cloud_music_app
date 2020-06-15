// import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String root = '/';
  static String login = '/login';
  static String home = '/home';

  static void configRouter(Router router) {
    // 404
    router.notFoundHandler = notFound;
    // 首页
    router.define(home, handler: homeHandler);
  }
}
