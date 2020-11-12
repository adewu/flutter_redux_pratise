import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class Banner extends Item{
  List<BannerItem> list;

  Banner(int type,this.list) : super(type);
}

class BannerItem{
  String title;
  String imagePath;
  BannerItem(this.title,this.imagePath);
}