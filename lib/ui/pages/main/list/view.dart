import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/data/repository/home_repository.dart';
import 'package:flutter_redux_pratise/ui/pages/main/list/ListItemView.dart';
import 'state.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../../../model/list/BaseModel.dart';
import '../../../../model/list/RankingItemModel.dart';
import '../../../../data/net/Api.dart';
import '../../../../api/RequestRoute.dart';

Widget buildView(
    HomeListState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Colors.blue,
    child: PageContentView(),
  );
}

class PageContentView extends StatefulWidget {
  @override
  _PageContentViewState createState() => _PageContentViewState();
}

class _PageContentViewState extends State<PageContentView> {
  List<RankingItemModel> items = [];
  var controller = EasyRefreshController();

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
          request();
          return;
        },
        child: creteGridView(),
      ),
    );
  }

  void request() {
    print('开启请求');
    HomeRepository().requestCategoryList().then((baseModel) {
      controller.finishRefresh(success: true);
      RankingMainModel mainModel =
      RankingMainModel.fromJson(baseModel.data.returnData);
      setState(() {
        items = mainModel.rankingList;
      });
    }, onError: (e) {
      controller.finishRefresh(success: true);
      print('请求错误$e');
    });
  }

  GridView creteGridView() {
    var gridView = GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 1),
      itemBuilder: (context, index) {
        RankingItemModel itemModel = items[index];
        ListItemView itemView = ListItemView(itemModel);
        return itemView;
      },
      itemCount: items.length,

    );
    return gridView;
  }
}
