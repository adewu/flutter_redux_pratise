import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/model/homebanner/HomeBannerItemModel.dart';
import 'package:flutter_redux_pratise/model/list_Item.dart';
import 'package:flutter_redux_pratise/redux/base/state.dart';
import 'package:flutter_redux_pratise/ui/widgets/component/banner/state.dart';

class HomeState extends BaseState implements Cloneable<HomeState> {

  List<HomeBannerItemModel> bannerItemList;
  List<ListItem> listItem;
  int listCount = 0;


  @override
  HomeState clone() {
    return HomeState()
      .. bannerItemList = bannerItemList
      .. listItem = listItem
      .. listCount = listCount
      .. currentState = currentState;
  }
}

HomeState initState(Map<String, dynamic> args) {

  return HomeState() .. currentState = ApiState.loading
    ..listCount = 0
    .. listItem = new List<ListItem>()
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