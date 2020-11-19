import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';
import 'package:flutter_redux_pratise/utils/log_util.dart';


typedef LoadMoreListener(int present);
typedef RefreshCallback();
typedef ScrollListener(int pixel);

class SmartListView<T> extends StatefulWidget {
  BaseAdapter adapter;
  final LoadMoreListener loadMoreListener;
  final RefreshCallback refreshListener;
  final ScrollListener scrollListener;

  SmartListView({this.refreshListener, this.loadMoreListener,this.adapter,this.scrollListener});

  @override
  State<StatefulWidget> createState() {
    return SmartListViewState();
  }
}

class SmartListViewState extends State<SmartListView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      if(widget.scrollListener != null){
        widget.scrollListener(_scrollController.position.pixels.toInt());
      }
    });
    super.initState();
  }

  void loadMore() {
    if (widget.loadMoreListener != null) {
      widget.loadMoreListener(widget.adapter.present);
    }
  }

  void refresh() {
    if (widget.refreshListener != null) {
      widget.refreshListener();
    }
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      header: MaterialHeader(),
      footer: ClassicalFooter(),
      onRefresh: () async {
        refresh();
        await widget.adapter.refresh().then((value) {
          widget.adapter.ezRefreshCtrl.finishRefresh(success: true);
        });
      },
      onLoad: !widget.adapter.needLoadMore()
          ? null
          : () async {
              loadMore();
              await widget.adapter
                  .loadMore(widget.adapter.ezRefreshCtrl)
                  .then((value) {
                print("onLoad: () async");
                widget.adapter.ezRefreshCtrl
                    .finishLoad(success: true, noMore: false);
              });
            },
      controller: widget.adapter.ezRefreshCtrl,
      enableControlFinishRefresh: true,
      enableControlFinishLoad: true,
      child: ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        itemCount: widget.adapter.getDataSize(),
        itemBuilder: (context, position) {
          // print("position" +
          //     position.toString() +
          //     "------" +
          //     "widget.adapter.getDataSize()" +
          //     widget.adapter.getDataSize().toString());
          return widget.adapter.getWidgetByPosition(position);
        },
      ),
    );
  }
}
