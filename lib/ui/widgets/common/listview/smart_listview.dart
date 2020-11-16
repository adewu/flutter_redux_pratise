import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
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

  SmartListView({this.refreshListener, this.loadMoreListener, this.adapter});

  @override
  State<StatefulWidget> createState() {
    return SmartListViewState();
  }
}

class SmartListViewState extends State<SmartListView> {
  @override
  void initState() {
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
      header: ClassicalHeader(),
      footer: ClassicalFooter(),
      onRefresh: () async {
        refresh();
        await widget.adapter.refresh().then((value) {
          print("onRefresh: () async");
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
        itemCount: widget.adapter.getDataSize(),
        itemBuilder: (context, position) {
          print("position" +
              position.toString() +
              "------" +
              "widget.adapter.getDataSize()" +
              widget.adapter.getDataSize().toString());
          return widget.adapter.getWidgetByPosition(position);
        },
      ),
    );
  }
}
