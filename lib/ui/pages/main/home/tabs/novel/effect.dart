import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/data/repository/home_repository.dart';
import 'package:flutter_redux_pratise/model/list/RecommendMainModel.dart';
import 'package:flutter_redux_pratise/ui/items/banner_item.dart';
import 'package:flutter_redux_pratise/ui/items/recommend.dart';
import 'package:flutter_redux_pratise/ui/pages/main/home/action.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

import 'action.dart';
import 'state.dart';

Effect<NovelState> buildEffect() {
  return combineEffects(<Object, Effect<NovelState>>{
    Lifecycle.initState: _init,
    NovelAction.refresh: _refresh,
  });
}

_init(Action action, Context<NovelState> ctx) {
  fetchData(ctx);
}

_refresh(Action action, Context<NovelState> ctx) {
  fetchData(ctx);
}


void fetchData(Context<NovelState> ctx) {
  HomeRepository().requestHomeNovelList().then((baseModel) {
    RecommendMainModel model = RecommendMainModel.fromJson(baseModel.data.returnData);
    var list = List<AdapterItem>();
    list.addAll(model.modules.modules);
    ctx.state.adapter.setNewData(list);
    ctx.state.adapter.addAdapterView(RecommendGridItem(1,ctx.context));
    ctx.dispatch(NovelActionCreator.onUpdateUI());
  }, onError: (e) {
    print('请求错误$e');
  });
}