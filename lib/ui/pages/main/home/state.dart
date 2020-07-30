import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/redux/base/state.dart';
import 'package:flutter_redux_pratise/ui/widgets/component/banner/state.dart';

class HomeState extends BaseState implements Cloneable<HomeState> {



  @override
  HomeState clone() {
    return HomeState() .. currentState = currentState;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState() .. currentState ;
}

class BannerConnector extends ConnOp<HomeState, BannerState> {
  @override
  BannerState get(HomeState state) {
    BannerState bannerState = BannerState();
    bannerState.setCurrentState(state.getCurrentState());
    if (state.getCurrentState() == ApiState.success) {
      bannerState.bannerModel = BannerModel(urlList: List.filled(1, "state.entity.focusImage"));
    }
    return bannerState;
  }
}