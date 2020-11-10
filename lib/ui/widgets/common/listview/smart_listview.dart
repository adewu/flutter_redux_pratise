import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

/**
 * 1.set data
 * 2.header
 * 3.footer
 * 4.multiple view
 *
 */

typedef LoadMoreListener(int present);
typedef RefreshCallback();

class SmartListView<T> extends StatefulWidget {
  BaseAdapter adapter;
  final LoadMoreListener loadMoreListener;
  final RefreshCallback refreshListener;

  SmartListView({
    this.refreshListener,
    this.loadMoreListener,
    this.adapter
  });

  @override
  State<StatefulWidget> createState() {
    return SmartListViewState();
  }
}

class SmartListViewState extends State<SmartListView> {
//  final originalItems = List<String>.generate(10000, (i) => "Item $i");
//  var items = List<String>();

  @override
  void initState() {
    super.initState();
  }

  void loadMore() {
    if(widget.loadMoreListener != null){
      widget.loadMoreListener(widget.adapter.present);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          return true;
        }
        return false;
      },
      child: RefreshIndicator(
        onRefresh: () {
          if(widget.refreshListener != null){
            widget.refreshListener();
          }
         return widget.adapter.completer.future;
        },
        child: ListView.builder(
          itemCount:
          widget.adapter.getDataSize(),
          itemBuilder: (context, position) {
            print("position" + position.toString());
            print("widget.adapter.getDataSize()" + widget.adapter.getDataSize().toString());
            if(position == widget.adapter.getDataSize() - 1){
              print("loadmore");
              loadMore();
              widget.adapter.loadingMore = true;
            }
            return generateItem(position);
          },
        ),
      )
    );
  }

  StatelessWidget generateItem(int position) {
//    print(position.toString() + "position == widget.adapter.mData.datas.length" + widget.adapter.mData.datas.length.toString());
//    var item =  (position == widget.adapter.mData.datas.length)
//        ? getFooterView()
//        : getItemByPosition(position);

    return getItemByPosition(position);
  }

//  Container getFooterView() {
//    print("getFooterView");
//    return Container(
//          color: Colors.greenAccent,
//          child: FlatButton(
//            child: Text("Load More"),
//            onPressed: () {
//              loadMore();
//            },
//          ),
//        );
//  }

  getItemByPosition(int position) {

    if(widget.adapter != null){
      return widget.adapter.getWidgetByPosition(position);
    }

  }
  
  
}
