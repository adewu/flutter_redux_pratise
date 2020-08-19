import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/model/homebanner/HomeBannerItemModel.dart';
import 'package:flutter_redux_pratise/redux/base/state.dart';
import 'package:flutter_redux_pratise/ui/widgets/component/banner/state.dart';

class HomeState extends BaseState implements Cloneable<HomeState> {

  List<HomeBannerItemModel> bannerItemList;


  @override
  HomeState clone() {
    return HomeState()
      .. bannerItemList = bannerItemList
      .. currentState = currentState;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState() .. currentState = ApiState.loading
    .. bannerItemList = new List<HomeBannerItemModel>();
}

class BannerConnector extends ConnOp<HomeState, BannerState> {
  @override
  BannerState get(HomeState state) {
    BannerState bannerState = BannerState();
    bannerState.setCurrentState(state.getCurrentState());
    if (state.getCurrentState() == ApiState.success) {
      bannerState.list = state.bannerItemList;
    }
    return bannerState;
  }
}