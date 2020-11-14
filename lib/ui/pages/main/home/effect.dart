import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/api/CommonRepository.dart';
import 'package:flutter_redux_pratise/data/db/dao/list_item.dart';
import 'package:flutter_redux_pratise/data/db/dbmanager.dart';
import 'package:flutter_redux_pratise/model/home/banner.dart';
import 'package:flutter_redux_pratise/model/homebanner/HomeBannerModel.dart';
import 'package:flutter_redux_pratise/model/list_Item.dart';
import 'package:flutter_redux_pratise/model/test/testa.dart';
import 'package:flutter_redux_pratise/model/test/testb.dart';
import 'package:flutter_redux_pratise/redux/base/state.dart';
import 'package:flutter_redux_pratise/ui/items/banner_item.dart';
import 'package:flutter_redux_pratise/ui/items/normal_item.dart';
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
  fetchListData(ctx);
}
_loadMore(Action action, Context<HomeState> ctx) {

  Future.delayed(Duration(seconds: 2)).then((value) => _addTestData(action,ctx));
}

_refresh(Action action, Context<HomeState> ctx) {

  Future.delayed(Duration(seconds: 2)).then((value) => _setNewData(action,ctx));
}

_setNewData(Action action, Context<HomeState> ctx) {
  // var items = Items();
  // for (int i = 0; i < 20; i++) {
  //   if(i % 2 == 0){
  //     items.addData(TestB(2,i.toString()));
  //   }else{
  //     items.addData(Normal(1,"双十一大战宣布退赛？搞情怀营销的网易严选还有戏吗？","http://img.zwbk.org/baike/spic/2015/11/11/20151111154022503_5500.jpg","IC实验室 $i分钟前"));
  //   }
  // }
  // ctx.state.adapter.setNewData(items.datas);
  // ctx.dispatch(HomeActionCreator.onAction());
}

_addTestData(Action action, Context<HomeState> ctx) {
  // var items = Items();
  // for (int i = 0; i < 20; i++) {
  //   if(i % 2 == 0){
  //     items.addData(TestB(2,i.toString()));
  //   }else{
  //     items.addData(Normal(1,"双十一大战宣布退赛？搞情怀营销的网易严选还有戏吗？","http://img.zwbk.org/baike/spic/2015/11/11/20151111154022503_5500.jpg","IC实验室 $i分钟前"));
  //   }
  // }
  // ctx.state.adapter.addData(items.datas);
  // ctx.dispatch(HomeActionCreator.onAction());
}



void fetchListData(Context<HomeState> ctx) {

  updateList(ctx,null);

}

void updateList(Context<HomeState> ctx, List<ListItem> item) {

  // List<AdapterView> views = List();
  // views.add(TestAItem(1));
  // views.add(TestBItem(2));
  // var blist = List<BannerItem>();
  // for (int i1 = 0; i1 < 4; i1++) {
  //   blist.add(BannerItem("test"+i1.toString(),"https://img.51miz.com/Element/00/70/00/81/321b8096_E700081_a5ccbb81.jpg!/quality/90/unsharp/true/compress/true/format/jpg/fh/630"));
  // }
  // var bb = Banner(3,blist);
  // views.add(BannerItemView(3));
  // var items = Items();
  // for (int i = 0; i < 20; i++) {
  //   if(i == 0){
  //     items.addData(bb);
  //   } else{
  //     items.addData(Normal(1,"双十一大战宣布退赛？搞情怀营销的网易严选还有戏吗？","http://img.zwbk.org/baike/spic/2015/11/11/20151111154022503_5500.jpg","IC实验室 $i分钟前"));
  //   }
  // }
  // ctx.state.data = items;
  // ctx.state.adapter = HomeAdapter();
  // ctx.state.adapter.setNewData(items.datas);
  // ctx.state.adapter.addAdapterViews(views);
  // ctx.dispatch(HomeActionCreator.onAction());
}





