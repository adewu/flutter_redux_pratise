import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/api/CommonRepository.dart';
import 'package:flutter_redux_pratise/model/homebanner/HomeBannerModel.dart';
import 'package:flutter_redux_pratise/redux/base/state.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init
  });
}

_init(Action action, Context<HomeState> ctx) {
  fetchBannerData(ctx);
}

void fetchBannerData(Context<HomeState> ctx) {
  CommonService apiService = new CommonService();
  apiService.getBanner((HomeBannerModel _bean) {
    if (_bean.data.length > 0) {
      ctx.state.currentState = ApiState.success;
      ctx.state.bannerItemList = _bean.data;
    }else{
      ctx.state.currentState = ApiState.error;
    }
    ctx.dispatch( HomeActionCreator.onAction());
  });
}

