import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/constant/constant.dart';
import 'package:flutter_redux_pratise/constant/page_route_name.dart';
import 'package:flutter_redux_pratise/model/homebanner/HomeBannerItemModel.dart';
import 'package:flutter_redux_pratise/model/list_Item.dart';
import 'package:flutter_redux_pratise/redux/base/state.dart';
import 'package:flutter_redux_pratise/ui/pages/main/home/home_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/indicator/top_text_indicator.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';
import 'package:flutter_redux_pratise/ui/widgets/component/banner/state.dart';

class HomeState extends BaseState implements Cloneable<HomeState> {

  int currentPageIndex;
  PageController pageController;
  List<Widget> pages;
  TopTextIndicatorItems indicators;

  @override
  HomeState clone() {
    return HomeState()
      ..pages = pages
      ..indicators = indicators
      ..currentPageIndex = currentPageIndex
      ..pageController = pageController;
  }
}

HomeState initState(Map<String, dynamic> args) {

  return HomeState()
    ..pageController = PageController(initialPage: 0)
    ..indicators = TopTextIndicatorItems(["推荐","VIP","订阅","排行"],0)
    ..pages = [
      Constant.routes.buildPage(PageRouteName.HOME_RECOMMEND, null),
      Constant.routes.buildPage(PageRouteName.HOME_VIP, null),
      Constant.routes.buildPage(PageRouteName.HOME_SUBSCRIPTION, null),
      Constant.routes.buildPage(PageRouteName.HOME_RANK, null),
    ];
}

