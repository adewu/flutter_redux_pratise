import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/src/refresher.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/common_item_view.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

abstract class BaseAdapter {
  Set<AdapterView> _views;
  Items _mData;
  bool loadMoreAble = true;
  int present = 0;

  bool needLoadMore();

  EasyRefreshController ezRefreshCtrl = EasyRefreshController();

  Completer<Void> _refreshCompleter = Completer();
  Completer<Void> _loadCompleter = Completer();

  BaseAdapter();

  setNewData(List<AdapterItem> data){
    if(_mData == null){
      _mData = Items();
    }
    if(_mData.datas != null) {
      _mData.datas.clear();
    }
    _mData.addAllData(data);
    present = 0;
    _refreshCompleter.complete();
  }

  addData(AdapterItem data){
    if(_mData == null){
      _mData = Items();
    }
    _mData.addData(data);
    present += 1;
    _loadCompleter.complete();
  }

  addAllData(List<AdapterItem> data){
    if(_mData == null){
      _mData = Items();
    }
    _mData.addAllData(data);
    present += 1;
    _loadCompleter.complete();
  }

  addAdapterViews(List<AdapterView> views){
    if(_views == null){
      _views = Set();
    }
    _views.addAll(views);
  }

  addAdapterView(AdapterView view){
    if(_views == null){
      _views = Set();
    }
    _views.add(view);
  }

  int getDataSize(){
    var size = 0;
    if(_mData != null && _mData.datas != null){
      size = _mData.datas.length;
    }
    return size;
  }


  getWidgetByPosition(int position) {
    var bean = _mData.datas[position];
    var type = bean.type;
    return generateView(type, bean);
  }

  Widget generateView(int type, AdapterItem bean) {
    Widget widget;
    if(_views == null){
      return Container();
    }
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

  Future refresh(){
    _refreshCompleter = Completer();
    return _refreshCompleter.future;
  }

  Future loadMore(EasyRefreshController controller){
    _loadCompleter = Completer();
    return _loadCompleter.future;

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
  BuildContext context;

  AdapterView(this.type,this.context);

  Widget createView(AdapterItem bean);
}
