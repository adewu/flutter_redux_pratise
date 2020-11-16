import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_redux_pratise/ui/pages/main/home/page.dart';
import 'package:flutter_redux_pratise/ui/pages/main/home/tabs/rank/page.dart';
import 'package:flutter_redux_pratise/ui/pages/main/home/tabs/recommend/page.dart';
import 'package:flutter_redux_pratise/ui/pages/main/home/tabs/subscription/page.dart';
import 'package:flutter_redux_pratise/ui/pages/main/home/tabs/vip/page.dart';
import 'package:flutter_redux_pratise/ui/pages/main/list/page.dart';
import 'package:flutter_redux_pratise/ui/pages/main/page.dart';
import 'package:flutter_redux_pratise/ui/pages/main/user/page.dart';


import 'constant/constant.dart';
import 'constant/page_route_name.dart';

/// 创建时间：2020/4/23 
/// 作者：wuxm
/// 描述：

class AppConfiguration{

 static Map<String, Page<Object, dynamic>> sPages = <String, Page<Object, dynamic>>{
   PageRouteName.MAIN: MainPage(),
   PageRouteName.HOME: HomePage(),
   PageRouteName.HOME_LIST: HomeListPage(),
   PageRouteName.HOME_USER: HomeUserPage(),
   PageRouteName.HOME_RECOMMEND: RecommendPage(),
   PageRouteName.HOME_VIP: VIPPage(),
   PageRouteName.HOME_SUBSCRIPTION: SubscriptionPage(),
   PageRouteName.HOME_RANK: RankPage(),
 };







}