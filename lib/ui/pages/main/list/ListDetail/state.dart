import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux_pratise/app.dart';
import 'package:flutter_redux_pratise/constant/constant.dart';
import 'package:flutter_redux_pratise/constant/page_route_name.dart';

class ListDetailState implements Cloneable<ListDetailState> {
  List<Widget> pages;
  int currentPageIndex;

  @override
  ListDetailState clone() {
    return ListDetailState();
  }
}

ListDetailState initState(Map<String, dynamic> args) {
  return ListDetailState();
}
