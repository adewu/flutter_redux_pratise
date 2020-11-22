import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/data/repository/home_repository.dart';
import 'package:flutter_redux_pratise/ui/pages/main/list/ListItemView.dart';
import 'state.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'action.dart';
import '../../../../model/list/RankingItemModel.dart';

Widget buildView(
    HomeListState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Colors.blue,
    child: PageContentView(dispatch, viewService, state),
  );
}

class PageContentView extends StatefulWidget {
  Dispatch dispatch;
  ViewService viewService;
  HomeListState state;

  PageContentView(this.dispatch, this.viewService, this.state);

  initState() {}

  @override
  _PageContentViewState createState() =>
      _PageContentViewState(this.dispatch, this.viewService, this.state);
}

class _PageContentViewState extends State<PageContentView> {
  var controller = EasyRefreshController();
  Dispatch dispatch;
  ViewService viewService;
  HomeListState state;

  _PageContentViewState(this.dispatch, this.viewService, this.state);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('调用初始化');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.finishRefresh();
    super.dispose();

    print('销毁事件');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '分类',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: EasyRefresh(
        enableControlFinishLoad: true,
        enableControlFinishRefresh: true,
        controller: controller,
        header: TaurusHeader(
          backgroundColor: Colors.blueAccent,
        ),
        onRefresh: () async {
          dispatch(HomeListActionCreator.onRefresh());
        },
        child: creteGridView(),
      ),
    );
  }

  GridView creteGridView() {
    print('创建 creteGridView');
    List<RankingItemModel> list = [];
    if (state.rankingMainModel.rankingList != null) {
      list = state.rankingMainModel.rankingList;
    }
    var gridView = GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 1),
      itemBuilder: (context, index) {
        RankingItemModel itemModel = list[index];
        ListItemView itemView = ListItemView(itemModel);
        return itemView;
      },
      itemCount: list.length,
    );
    return gridView;
  }
}
