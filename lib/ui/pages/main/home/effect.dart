import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/api/CommonRepository.dart';
import 'package:flutter_redux_pratise/data/db/dao/list_item.dart';
import 'package:flutter_redux_pratise/data/db/dbmanager.dart';
import 'package:flutter_redux_pratise/model/homebanner/HomeBannerModel.dart';
import 'package:flutter_redux_pratise/model/list_Item.dart';
import 'package:flutter_redux_pratise/model/test/testa.dart';
import 'package:flutter_redux_pratise/model/test/testb.dart';
import 'package:flutter_redux_pratise/redux/base/state.dart';
import 'package:flutter_redux_pratise/ui/items/banner.dart';
import 'package:flutter_redux_pratise/ui/items/testa_item.dart';
import 'package:flutter_redux_pratise/ui/items/testb_item.dart';
import 'package:flutter_redux_pratise/ui/pages/main/home/home_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';
import 'action.dart';
import 'state.dart';
import 'package:sqflite/sqflite.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
    HomeAction.loadMore: _loadMore,
    HomeAction.refresh: _refresh,
  });
}

_init(Action action, Context<HomeState> ctx) {
  fetchBannerData(ctx);
  fetchListData(ctx);
}
_loadMore(Action action, Context<HomeState> ctx) {

  Future.delayed(Duration(seconds: 2)).then((value) => _addTestData(action,ctx));
}

_refresh(Action action, Context<HomeState> ctx) {

  Future.delayed(Duration(seconds: 2)).then((value) => _setNewData(action,ctx));
}

_setNewData(Action action, Context<HomeState> ctx) {
  var items = Items();
  for (int i = 0; i < 20; i++) {
    if(i % 2 == 0){
      items.addData(TestB(2,i.toString()));
    }else{
      items.addData(TestA(1,i.toString(),"http://img.zwbk.org/baike/spic/2015/11/11/20151111154022503_5500.jpg"));
    }
  }
  ctx.state.adapter.setNewData(items.datas);
  ctx.dispatch(HomeActionCreator.onAction());
}

_addTestData(Action action, Context<HomeState> ctx) {
  var items = Items();
  for (int i = 0; i < 20; i++) {
    if(i % 2 == 0){
      items.addData(TestB(2,i.toString()));
    }else{
      items.addData(TestA(1,i.toString(),"http://img.zwbk.org/baike/spic/2015/11/11/20151111154022503_5500.jpg"));
    }
  }
  ctx.state.adapter.addData(items.datas);
  ctx.dispatch(HomeActionCreator.onAction());
}



void fetchListData(Context<HomeState> ctx) {
//  ListItemDAO dao = ListItemDAO();
//  dao.queryAllItems().then((items){
//    if(items.isEmpty){
//      //insert data
//      dao.insert(ListItem(id: 1,content: "1111"));
//      dao.insert(ListItem(id: 2,content: "2222"));
//      dao.insert(ListItem(id: 3,content: "3333"));
//      dao.queryAllItems().then((items){
//        updateList(ctx,items);
//      });
//    }else{
//      //update listview
//      println(items[0].content);
//    }
//  });
  updateList(ctx,null);

}

void updateList(Context<HomeState> ctx, List<ListItem> item) {

//  ctx.state.listItem = item;
//  ctx.state.listCount = ctx.state.listCount + item.length;

  ctx.state.typeCount = 2;

  List<AdapterView> views = List();
  views.add(TestAItem(1));
  views.add(TestBItem(2));
  var items = Items();
  for (int i = 0; i < 20; i++) {
    if(i % 2 == 0){
      items.addData(TestB(2,i.toString()));
    }else{
      items.addData(TestA(1,i.toString(),"http://img.zwbk.org/baike/spic/2015/11/11/20151111154022503_5500.jpg"));
    }
  }
  ctx.state.data = items;
  ctx.state.adapter = HomeAdapter(ctx.state.typeCount);
  ctx.state.adapter.setNewData(items.datas);
  ctx.state.adapter.addAdapterViews(views);
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

