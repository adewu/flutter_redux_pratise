import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_redux_pratise/data/net/dio_util.dart';
import 'package:flutter_redux_pratise/model/list/BaseModel.dart';

class BaseRepository {

  Future<BaseModel> request(String url, Map<String, dynamic> params,
      {Map<String, dynamic> headers, String method, bool isContentTypeJson}) async {

    var response;
//    try {
      Options options;

      if (headers != null) {
        options = new Options();
        options.headers.addAll(headers);
      }

      response = await DioUtil().request(url, params,
          options: options, method: method, isContentTypeJson: isContentTypeJson);
//    } catch (e) {
//      return null;
//    }
    return response;
  }
}
