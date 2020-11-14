import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

Future requestList(String url, {Map params}) async {
  try {
    BaseOptions options = BaseOptions(responseType: ResponseType.json);
    Dio dio = new Dio(options);
    ///代理
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.findProxy = (uri) {
    //     return "PROXY 10.252.167.55:8888";
    //   };
    // };
    var response = await dio.get(url, queryParameters: params);
    if (response.statusCode != 200 || response.data == null) {
      throw Future.error('请求错误');
    }
    return response.data;
  } catch (e) {
    return e;
    print('请求错误$e');
  }
}
