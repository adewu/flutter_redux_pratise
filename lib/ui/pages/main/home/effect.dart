import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/utils/log_util.dart';
import 'action.dart';
import 'state.dart';
import 'package:sqflite/sqflite.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
    HomeAction.listScroll: _listScroll,
    HomeAction.pageChange:_pageChanged,
  });
}

_listScroll(Action action, Context<HomeState> ctx) {
  ctx.state.curPixels = action.payload;
  ctx.dispatch(HomeActionCreator.onUpdateUI());
}


_pageChanged(Action action, Context<HomeState> ctx) {
  ctx.state.currentPageIndex = action.payload;
  ctx.state.indicators.selected = action.payload;
  ctx.dispatch(HomeActionCreator.onUpdateUI());
}

_init(Action action, Context<HomeState> ctx) {
}




