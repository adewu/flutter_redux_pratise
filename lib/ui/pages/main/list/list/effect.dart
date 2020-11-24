import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/constant/page_route_name.dart';
import 'package:flutter_redux_pratise/data/repository/home_repository.dart';
import 'package:flutter_redux_pratise/model/list/RankingItemModel.dart';
import 'package:flutter/material.dart' hide Action, Page;
import 'action.dart';
import 'state.dart';

Effect<HomeListState> buildEffect() {
  return combineEffects(<Object, Effect<HomeListState>>{
    HomeListAction.refresh: _onRefresh,
    HomeListAction.selectItem: _selectItem,
  });
}

void _onRefresh(Action action, Context<HomeListState> ctx) async {
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

void _selectItem(Action action, Context<HomeListState> ctx) {
  print('选择条目$action.type');
  Navigator.of(ctx.context)
      .pushNamed(PageRouteName.List_Detail, arguments: null);
}
