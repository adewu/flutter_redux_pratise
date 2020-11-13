import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'state.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../../../model/list/BaseModel.dart';
import '../../../../model/list/RankingItemModel.dart';
import '../../../../api/ManApi.dart';
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
        title: Text('分类'),
        backgroundColor: Colors.white,
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
    var url = ManApi.cateList;
    requestList(url, params: null).then((value) {
      controller.finishRefresh(success: true);
      BaseModel baseModel = new BaseModel.fromMap(value);
      RankingMainModel mainModel =
          RankingMainModel.fromJson(baseModel.data.returnData);
      print(mainModel.rankingList);

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
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 3,
          childAspectRatio: 0.6),
      itemBuilder: (context, index) {
        RankingItemModel itemModel = items[index];
        var tile = ListTile(
          title: Text(
            itemModel.sortName,
            style: TextStyle(color: Colors.deepOrangeAccent),
          ),
          subtitle: Image.network(itemModel.cover),
          onTap: () {
            print('点击的条目 $index');
          },
        );
        return tile;
      },
      itemCount: items.length,
    );
    return gridView;
  }
}
