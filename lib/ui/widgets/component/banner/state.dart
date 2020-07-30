import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/redux/base/state.dart';

class BannerState extends BaseState implements Cloneable<BannerState>  {

  BannerModel bannerModel;

  @override
  BannerState clone() {
    return BannerState() .. bannerModel = bannerModel
      ..currentState .. currentState;
  }
}

BannerState initState(Map<String, dynamic> args) {
  return BannerState() .. bannerModel = BannerModel(urlList: new List());
}

class BannerModel{

  List<String> urlList;

  BannerModel({urlList});


}