import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './application.dart';

class RouterUtils {
  // 返回
  static void goBack(BuildContext context) {
    Application.router.pop(context);
  }

  // 带参数返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  // 返回指定页面
  static void goBackUrl(BuildContext context, String routeName) {
    Navigator.popAndPushNamed(context, routeName);
  }

  // 返回主页面
  static void goHome(BuildContext context) {
    Application.router.navigateTo(context, '/home', clearStack: true);
  }

  // 返回主页面
  static void goLogin(BuildContext context) {
    Application.router.navigateTo(context, '/login', replace: true, clearStack: true);
  }

  // 跳转页面
  static Future navigateTo(BuildContext context, String path, [Map<String, String> params, TransitionType transition]) {
    var encodeParams = '';
    if(params != null && params.isNotEmpty) {
      params.forEach((String key, String value){
        encodeParams += '$key=$value&';
      });
    }
    
    return Application.router.navigateTo(context, encodeParams == '' ? path : '$path?$encodeParams');
  }
}
