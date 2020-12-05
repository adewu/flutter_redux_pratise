

import 'package:flutter_redux_pratise/data/net/Api.dart';
import 'package:flutter_redux_pratise/data/net/dio_util.dart';
import 'package:flutter_redux_pratise/data/repository/base_repository.dart';
import 'package:flutter_redux_pratise/model/list/BaseModel.dart';

class ComicRepository extends BaseRepository{
  Future<BaseModel> requestDetailStatic(int comicId) async {
    var m = Map<String,dynamic>();
    m["comicid"] = comicId;
    BaseModel response =
    await request(Api.detailStatic, m, isContentTypeJson: true,method: Method.get);
    if (response != null && response.code == 1) {
      return response;
    } else {
      return Future.error(response.data.message);
    }
  }

  Future<BaseModel> requestDetailRealTime(int comicId) async {
    var m = Map<String,dynamic>();
    m["comicid"] = comicId;
    BaseModel response =
    await request(Api.detailRealtime, m, isContentTypeJson: true,method: Method.get);
    if (response != null && response.code == 1) {
      return response;
    } else {
      return Future.error(response.data.message);
    }
  }

}