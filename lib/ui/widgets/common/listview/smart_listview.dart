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

class SmartListView<T> extends StatefulWidget {
  int present = 0;
  int pageCount = 20;
  bool loadComplete = false;
  BaseAdapter adapter;
  final LoadMoreListener loadMoreListener;


  SmartListView({
    this.pageCount,
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
      widget.loadMoreListener(widget.present);
    }
//    setState(() {
//      if ((widget.present + widget.pageCount) > originalItems.length) {
//        items.addAll(originalItems.getRange(widget.present, originalItems.length));
//      } else {
//        items.addAll(originalItems.getRange(widget.present, widget.present + widget.pageCount));
//      }
//      widget.present = widget.present + widget.pageCount;
//    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && widget.loadComplete) {
          loadMore();
          return true;
        }
        return false;
      },
      child: ListView.builder(
        itemCount:
            widget.adapter.data.datas.length,
        itemBuilder: (context, position) {
          return generateItem(position);
        },
      ),
    );
  }

  StatelessWidget generateItem(int position) {
    var item =  (position == widget.adapter.data.datas.length)
        ? getFooterView()
        : getItemByPosition(position);
    return item;
  }

  Container getFooterView() {
    return Container(
          color: Colors.greenAccent,
          child: FlatButton(
            child: Text("Load More"),
            onPressed: () {
              loadMore();
            },
          ),
        );
  }

  getItemByPosition(int index) {

    if(widget.adapter != null){
      return widget.adapter.getWidgetByPosition(index);
    }

    // return ListTile(
    //   title: Text('${widget.data[index]}'),
    // );
  }
  
  
}
