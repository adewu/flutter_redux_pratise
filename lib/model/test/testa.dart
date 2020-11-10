import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class TestA extends Item{
//  TestA(this.type,this.text,this.img);
  String text;
  String img;

  TestA(int type,this.text,this.img) : super(type);
}