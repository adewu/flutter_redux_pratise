import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/constant/constant.dart';
import 'package:flutter_redux_pratise/constant/page_route_name.dart';
import 'package:flutter_redux_pratise/model/list_Item.dart';
import 'package:flutter_redux_pratise/redux/base/state.dart';
import 'package:flutter_redux_pratise/ui/pages/main/home/home_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/indicator/top_text_indicator.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class HomeState extends BaseState implements Cloneable<HomeState> {

  int currentPageIndex;
  PageController pageController;
  List<Widget> pages;
  TopTextIndicatorItems indicators;
  int curPixels;

  @override
  HomeState clone() {
    return HomeState()
      ..pages = pages
      ..curPixels = curPixels
      ..indicators = indicators
      ..currentPageIndex = currentPageIndex
      ..pageController = pageController;
  }
}

HomeState initState(Map<String, dynamic> args) {

  return HomeState()
    ..pageController = PageController(initialPage: 0)
    ..indicators = TopTextIndicatorItems(["推荐","小说","订阅","排行"],0)
    ..curPixels = 0
    ..currentPageIndex = 0
    ..pages = [
      Constant.routes.buildPage(PageRouteName.HOME_RECOMMEND, null),
      Constant.routes.buildPage(PageRouteName.HOME_NOVEL, null),
      Constant.routes.buildPage(PageRouteName.HOME_SUBSCRIPTION, null),
      Constant.routes.buildPage(PageRouteName.HOME_RANK, null),
    ];
}

