import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/data/repository/home_repository.dart';
import 'package:flutter_redux_pratise/model/list/RankingItemModel.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeListState> buildEffect() {
  return combineEffects(<Object, Effect<HomeListState>>{
    HomeListAction.refresh: _onRefresh,
  });
}

void _onRefresh(Action action, Context<HomeListState> ctx) {
  print('通过Action 调用事件');
  print('开启请求');
  HomeRepository().requestCategoryList().then((baseModel) {
    RankingMainModel mainModel =
        RankingMainModel.fromJson(baseModel.data.returnData);
    ctx.state.rankingMainModel = mainModel;
    ctx.dispatch(HomeListActionCreator.onUpdateUi());
  }, onError: (e) {
    print('请求错误$e');
  });
}
