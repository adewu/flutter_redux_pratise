import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class Normal extends AdapterItem{
//  TestA(this.type,this.text,this.img);
  String text;
  String img;
  String from;

  Normal(int type,this.text,this.img,this.from) : super(type);
}