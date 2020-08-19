import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/model/homebanner/HomeBannerItemModel.dart';
import 'package:flutter_redux_pratise/redux/base/state.dart';

class BannerState extends BaseState implements Cloneable<BannerState>  {

  List<HomeBannerItemModel> list;

  @override
  BannerState clone() {
    return BannerState() .. list = list
      ..currentState .. currentState;
  }
}

BannerState initState(Map<String, dynamic> args) {
  return BannerState()
    ..currentState = ApiState.loading
    .. list = Iterable.empty();
}

