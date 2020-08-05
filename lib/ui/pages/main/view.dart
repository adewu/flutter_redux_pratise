import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {

  return Scaffold(
    body: PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: state.pageController,
      children: state.pages,
    ),
    bottomNavigationBar: BottomNavigationBar(
      fixedColor: Colors.red,
      //底部导航栏按钮选中时的颜色
      type: BottomNavigationBarType.fixed,
      //底部导航栏的适配，当item多的时候都展示出来
      currentIndex: state.currentPageIndex,
      onTap: (index) {
          state.pageController.jumpToPage(index);
        dispatch(MainActionCreator.onSwitchTabAction(index));
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
        BottomNavigationBarItem(icon: Icon(Icons.category), title: Text("列表")),
        BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("我的"))
      ],
    ),
  );
}
