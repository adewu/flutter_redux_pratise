import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/data/repository/home_repository.dart';
import 'package:flutter_redux_pratise/model/home/banner.dart';
import 'package:flutter_redux_pratise/model/list/RecommendMainModel.dart';
import 'package:flutter_redux_pratise/ui/items/banner_item.dart';
import 'package:flutter_redux_pratise/ui/items/recommend.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';
import 'package:flutter_redux_pratise/utils/log_util.dart';

import 'action.dart';
import 'state.dart';

Effect<RecommendState> buildEffect() {
  return combineEffects(<Object, Effect<RecommendState>>{
    Lifecycle.initState: _init,
    RecommendAction.refresh: _refresh,
  });
}
_init(Action action, Context<RecommendState> ctx) {
  fetchData(ctx);
}

_refresh(Action action, Context<RecommendState> ctx) {
  fetchData(ctx);
}

void fetchData(Context<RecommendState> ctx) {
  HomeRepository().requestHomeRecommendList().then((baseModel) {
    RecommendMainModel model = RecommendMainModel.fromJson(baseModel.data.returnData);
    var list = List<AdapterItem>();
    list.add(model.galleryItems);
    list.addAll(model.modules.modules);
    ctx.state.adapter.setNewData(list);
    ctx.state.adapter.addAdapterView(BannerItemView(0,ctx.context));
    ctx.state.adapter.addAdapterView(RecommendGridItem(1,ctx.context));
    ctx.dispatch(RecommendActionCreator.onUpdateUI());
  }, onError: (e) {
    print('请求错误$e');
  });
}

