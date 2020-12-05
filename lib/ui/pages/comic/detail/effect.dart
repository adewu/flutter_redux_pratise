import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/data/repository/comic_repository.dart';
import 'package:flutter_redux_pratise/data/repository/home_repository.dart';
import 'package:flutter_redux_pratise/model/comic/comic_detail_realtime/ComicDetailRealTime.dart';
import 'package:flutter_redux_pratise/model/comic/comic_detail_static/ComicDetailStatic.dart';
import 'package:flutter_redux_pratise/model/list/RecommendMainModel.dart';
import 'package:flutter_redux_pratise/utils/toast_util.dart';

import 'action.dart';
import 'state.dart';

Effect<ComicDetailState> buildEffect() {
  return combineEffects(<Object, Effect<ComicDetailState>>{
    Lifecycle.initState: _init,
  });
}

void _init(Action action, Context<ComicDetailState> ctx) {
  fetchData(ctx);
}

void fetchData(Context<ComicDetailState> ctx) {
  ComicRepository().requestDetailStatic(ctx.state.comicId).then((baseModel) {
    if(baseModel.data.stateCode == 1) {
      ComicDetailStatic bean = ComicDetailStatic.fromJsonMap(
          baseModel.data.returnData);
      ctx.state.comicDetailStatic = bean;
      ctx.dispatch(ComicDetailActionCreator.updateUI());
    }else{
      ToastUtil.showShortToast(baseModel.data.message);
    }
    ctx.dispatch(ComicDetailActionCreator.updateUI());
  }, onError: (e) {
    ToastUtil.showShortToast(e.toString());
  });

  ComicRepository().requestDetailRealTime(ctx.state.comicId).then((baseModel) {
    if(baseModel.data.stateCode == 1) {
      ComicDetailRealTime bean = ComicDetailRealTime.fromJsonMap(
          baseModel.data.returnData);
      ctx.state.comicDetailRealTime = bean;
      ctx.dispatch(ComicDetailActionCreator.updateUI());
    }else{
      ToastUtil.showShortToast(baseModel.data.message);
    }
    ctx.dispatch(ComicDetailActionCreator.updateUI());
  }, onError: (e) {
    ToastUtil.showShortToast(e.toString());
  });
}
