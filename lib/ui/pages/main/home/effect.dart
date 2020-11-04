import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/api/CommonRepository.dart';
import 'package:flutter_redux_pratise/data/db/dao/list_item.dart';
import 'package:flutter_redux_pratise/data/db/dbmanager.dart';
import 'package:flutter_redux_pratise/model/homebanner/HomeBannerModel.dart';
import 'package:flutter_redux_pratise/model/list_Item.dart';
import 'package:flutter_redux_pratise/redux/base/state.dart';
import 'action.dart';
import 'state.dart';
import 'package:sqflite/sqflite.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init
  });
}

_init(Action action, Context<HomeState> ctx) {
  fetchBannerData(ctx);
  fetchListData(ctx);
}

void fetchListData(Context<HomeState> ctx) {
  ListItemDAO dao = ListItemDAO();
  dao.queryAllItems().then((items){
    if(items.isEmpty){
      //insert data
      dao.insert(ListItem(id: 1,content: "1111"));
      dao.insert(ListItem(id: 2,content: "2222"));
      dao.insert(ListItem(id: 3,content: "3333"));
      dao.queryAllItems().then((items){
        updateList(ctx,items);
      });
    }else{
      //update listview
      println(items[0].content);
    }
  });
}

void updateList(Context<HomeState> ctx, List<ListItem> items) {
  ctx.state.listItem = items;
  ctx.state.listCount = ctx.state.listCount + items.length;
  ctx.dispatch(HomeActionCreator.onAction());
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
    ctx.state.listCount = ctx.state.listCount + 1;
    ctx.dispatch( HomeActionCreator.onAction());
  });
}

