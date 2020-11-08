import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class BaseAdapter{
  int typeCount;
  Map<int,Widget> widgets;
  Items data;

  getWidgetByPosition(int position) {

   var bean =  data.datas[position];
   var type =  bean.type;


  }


}