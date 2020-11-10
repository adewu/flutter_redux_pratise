import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux_pratise/model/test/testa.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class TestAItem extends AdapterView{
  TestAItem(int type) : super(type);

  @override
  Widget createView(Item bean) {
    var b = bean as TestA;
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            child: Image.network(
              b.img,
              fit: BoxFit.cover,
            ),
          ),
          Text("TestAItem"+b.text),
        ],
      ),
    );
  }



}