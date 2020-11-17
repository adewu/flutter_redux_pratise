

import 'package:flutter_redux_pratise/data/net/Api.dart';
import 'package:flutter_redux_pratise/data/repository/base_repository.dart';
import 'package:flutter_redux_pratise/model/list/BaseModel.dart';

class HomeRepository extends BaseRepository{
  Future<BaseModel> requestCategoryList() async {
    BaseModel response =
    await request(Api.cateList, null, isContentTypeJson: true);
    if (response != null && response.code == 1) {
      return response;
    } else {
      return Future.error(response.data.message);
    }
  }

  Future<BaseModel> requestHomeRecommendList() async {
    var m = Map<String,dynamic>();
    // m["sexType"] = 0;
    BaseModel response =
    await request(Api.boutiqueList, m, isContentTypeJson: true);
    if (response != null && response.code == 1) {
      return response;
    } else {
      return Future.error(response.data.message);
    }
  }
}