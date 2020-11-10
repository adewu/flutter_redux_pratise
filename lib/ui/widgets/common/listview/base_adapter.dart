import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/common_item_view.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

abstract class BaseAdapter {
  int typeCount;
  List<AdapterView> _views;
  Items _mData;
  bool loadMoreAble = true;
  bool loadingMore = false;
  int present = 0;
  final Completer<void> completer = Completer<void>();


  BaseAdapter(this.typeCount);

  setNewData(List<Item> data){
    if(_mData == null){
      _mData = Items();
    }
    removeLoadMoreItemIfHas();
    if(_mData.datas != null) {
      _mData.datas.clear();
    }
    completer.complete();
    _mData.addAllData(data);
    present = 0;
    checkIsLoadMoreAble();
  }

  addData(List<Item> data){
    if(_mData == null){
      _mData = Items();
    }
    removeLoadMoreItemIfHas();
    _mData.addAllData(data);
    present += 1;
    checkIsLoadMoreAble();
  }

  addAdapterViews(List<AdapterView> views){
    if(_views == null){
      _views = List();
    }
    _views.addAll(views);
    if(loadMoreAble){
      _views.add(FooterItemView(-1));
    }
  }

  int getDataSize(){
    var size = 0;
    if(_mData.datas != null){
      size = _mData.datas.length;
    }
    return size;
  }


  getWidgetByPosition(int position) {
    var bean = _mData.datas[position];
    var type = bean.type;
    return generateView(type, bean);
  }

  Widget generateView(int type, Item bean) {
    Widget widget;
    _views.forEach((element) {
      if (element.type == type) {
        widget = element.createView(bean);
      }
    });
    if (widget == null) {
      return Container(
        child: Text("no view be founded"),
      );
    }
    return widget;
  }

  void checkIsLoadMoreAble() {
    if(_mData != null && _mData.datas != null && _mData.datas.isNotEmpty && loadMoreAble){
      _mData.addData(FooterItem());
    }
  }
  void removeLoadMoreItemIfHas(){
    if(_mData != null && _mData.datas != null && _mData.datas.isNotEmpty && loadMoreAble){
      _mData.datas.removeLast();
    }
  }

}

abstract class AdapterView {
  int type;

  AdapterView(this.type);

  Widget createView(Item bean);
}
