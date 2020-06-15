import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:flustars/flustars.dart';

class RequestUtil {
  static final Dio mdio = Dio();

  static init(String url) {
    mdio.options.baseUrl = url;
    mdio.options.connectTimeout = 5000;
    mdio.options.receiveTimeout = 3000;
    mdio.interceptors.add(DioLogInterceptor());
  }

  static Future<Response> doHttpGet(String url) async {
    Response response = await mdio.get(url);
    response.data['code'] != null ? LogUtil.e('请求地址:$url 响应状态码:${response.data['code']}') : LogUtil.e(response.data);
    return response;
  }

  static Future<Response> doHttpPost(String url, Map<String, dynamic> params) async {
    Response response = await mdio.post(url, data: params);
    response.data['code'] != null ? LogUtil.e('请求地址:$url 响应状态码:${response.data['code']}') : LogUtil.e(response.data);
    return response;
  }
}