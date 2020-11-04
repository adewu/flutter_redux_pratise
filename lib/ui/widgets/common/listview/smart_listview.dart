import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/**
 * 1.set data
 * 2.header
 * 3.footer
 * 4.multiple view
 *
 */

typedef LoadMoreListener(int present);

class SmartListView extends StatefulWidget {
  List<String> data;
  int present = 0;
  int pageCount = 20;
  bool loadComplete = false;
  final LoadMoreListener loadMoreListener;


  SmartListView({
    this.data,
    this.pageCount,
    this.loadMoreListener
  });

  void addData(List<String> more){
    data.addAll(more);
  }

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
            widget.data.length,
        itemBuilder: (context, index) {
          return generateItem(index);
        },
      ),
    );
  }

  StatelessWidget generateItem(int index) {
    var item =  (index == widget.data.length)
        ? getFooterView()
        : getItemByIndex(index);
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

  getItemByIndex(int index) {
    return ListTile(
      title: Text('${widget.data[index]}'),
    );
  }
  
  
}
