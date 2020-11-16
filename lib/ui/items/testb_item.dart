import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux_pratise/model/test/testa.dart';
import 'package:flutter_redux_pratise/model/test/testb.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class TestBItem extends AdapterView{
  TestBItem(int type) : super(type,null);

  @override
  Widget createView(Item bean) {
    var b = bean as TestB;
    return Container(
      alignment:Alignment.center,
      height: 40,
      child: Text("TestBItem" + b.text),
    );
  }



}