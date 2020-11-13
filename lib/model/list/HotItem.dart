

class HotMainModel {
  List<HotItem> hotItems;
  String defaultSearch;

  HotMainModel({this.hotItems, this.defaultSearch});

  factory HotMainModel.fromMap(Map<String, dynamic> map) {
    dynamic obj = map['hotItems'];
    List<HotItem> hotItems = [];
    if (obj is List) {
      List<dynamic> items = obj;
      hotItems = items.map((e) => HotItem.fromMap(e)).toList();
    }
    return HotMainModel(
        hotItems: hotItems, defaultSearch: map['defaultSearch']);
  }
}

class HotItem {
  String name;
  String comic_id;
  String bgColor;

  HotItem({this.name, this.comic_id, this.bgColor});

  factory HotItem.fromMap(Map<String, dynamic> map) {
    return HotItem(
        name: map['name'], comic_id: map['comic_id'], bgColor: map['bgColor']);
  }
}
