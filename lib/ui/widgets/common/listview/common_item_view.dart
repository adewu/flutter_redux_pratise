import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class FooterItemView extends AdapterView{
  FooterItemView(int type) : super(type,null);

  @override
  Widget createView(Item bean) {
    return Container(
      color: Colors.greenAccent,
      child: FlatButton(
        child: Text("Load More"),
        onPressed: () {
//          loadMore();
        },
      ),
    );
  }

}

class FooterItem extends Item{
  FooterItem() : super(-1);

}