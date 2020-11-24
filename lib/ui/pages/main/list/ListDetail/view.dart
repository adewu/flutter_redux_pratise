import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ListDetailState state, Dispatch dispatch, ViewService viewService) {
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  return PageContentView(state, dispatch, viewService);
}

class PageContentView extends StatefulWidget {
  Dispatch dispatch;
  ViewService viewService;
  ListDetailState state;

  PageContentView(this.state, this.dispatch, this.viewService);

  initState() {}

  @override
  _PageContentViewState createState() =>
      _PageContentViewState(this.dispatch, this.viewService, this.state);
}

class _PageContentViewState extends State<PageContentView> {
  var controller = EasyRefreshController();
  Dispatch dispatch;
  ViewService viewService;
  ListDetailState state;

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
          '详情页',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: EasyRefresh(
        enableControlFinishLoad: true,
        enableControlFinishRefresh: true,
        controller: controller,
        header: DeliveryHeader(
          backgroundColor: Colors.green,
        ),
        onRefresh: () async {},
        child: createListView(),
      ),
    );
  }

  createListView() {
    ListView listView = ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('详情页'),
        );
      },
      itemCount: 100,
    );
    return listView;
  }
}
