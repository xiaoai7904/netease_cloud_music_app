import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RequestUtil {
  static final Dio mdio = Dio();

  static init(String url) {
    mdio.options.baseUrl = url;
    mdio.options.connectTimeout = 5000;
    mdio.options.receiveTimeout = 3000;
    mdio.interceptors.add(DioLogInterceptor());
  }

  static Future<Response> doHttpGet(String url, Map<String, dynamic> params) async {
    try {
      var encodeParams = '';
      if (params != null && params.isNotEmpty) {
        params.forEach((String key, dynamic value) {
          encodeParams += '$key=$value&';
        });
      }

      Response response = await mdio.get(encodeParams == '' ? url : '$url?$encodeParams');
      response.data['code'] != null ? LogUtil.e('请求地址:$url 响应状态码:${response.data['code']} -> 请求参数: ${json.encode(params)}') : LogUtil.e(response.data);
      return response;
    } catch (e) {
      LogUtil.e('请求错误:$e');
      return new Future(() => e.response);
    }
  }

  static Future<Response> doHttpPost(String url, Map<String, dynamic> params) async {
    try {
      Response response = await mdio.post(url, queryParameters: params);
      response.data['code'] != null ? LogUtil.e('请求地址:$url 响应状态码:${response.data['code']} -> 请求参数: ${json.encode(params)}') : LogUtil.e(response.data);
      return response;
    } catch (e) {
      LogUtil.e('请求错误:$e');
      Fluttertoast.showToast(
        msg: "网络异常",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return new Future(() => e.response);
    }
  }
}
