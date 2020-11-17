import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class RecommendMainModel {
  GalleryItems galleryItems;
  var textItems;
  Modules modules;

  RecommendMainModel({
    this.galleryItems,
    this.textItems,
    this.modules,
  });

  factory RecommendMainModel.fromJson(Map map) {
    var gitems = List<GalleryItem>();
    map['galleryItems'].forEach((value) {
      gitems.add(GalleryItem.fromJson(value));
    });
    var mitems = List<Module>();
    map['modules'].forEach((value) {
      mitems.add(Module.fromJson(value));
    });
    return RecommendMainModel(
        galleryItems: GalleryItems(galleryItems: gitems),
        textItems: map['textItems'],
        modules: Modules(modules: mitems));
  }
}

class GalleryItems extends AdapterItem {
  List<GalleryItem> galleryItems;

  GalleryItems({this.galleryItems}) : super(0);
}

class Modules {
  List<Module> modules;

  Modules({this.modules});
}

class GalleryItem {
  int linkType;
  String cover;
  int id;
  String title;
  String content;
  String topCover;

  GalleryItem({
    this.linkType,
    this.cover,
    this.id,
    this.title,
    this.content,
    this.topCover,
  });

  factory GalleryItem.fromJson(Map map) {
    return GalleryItem(
      linkType: map['linkType'],
      cover: map['cover'],
      id: map['id'],
      title: map['title'],
      content: map['content'],
      topCover: map['topCover'],
    );
  }

}

class ModuleInfo {
  String argName;
  int argValue;
  String title;
  String icon;
  String bgCover;

  ModuleInfo(
      {this.argName, this.argValue, this.title, this.icon, this.bgCover});

  factory ModuleInfo.fromJson(Map map) {
    return ModuleInfo(
      argName: map['argName'],
      argValue: map['argValue'],
      title: map['title'],
      icon: map['icon'],
      bgCover: map['bgCover'],
    );
  }
}

class Item {
  int linkType;
  int comicId;
  String title;
  String cover;
  String subTitle;
  String content;

  Item({this.linkType, this.comicId, this.title, this.cover, this.subTitle,
    this.content});

  factory Item.fromJson(Map map) {
    return Item(
      linkType: map['linkType'],
      comicId: map['comicId'],
      title: map['title'],
      cover: map['cover'],
      subTitle: map['subTitle'],
      content: map['content'],
    );
  }
}

class Module extends AdapterItem {

  int itemCount;
  int moduleType;
  int uiType;
  ModuleInfo moduleInfo;
  List<Item> items;
  List<List<Item>> itemArray;

  Module({
    this.moduleType,
    this.uiType,
    this.moduleInfo,
    this.items,
    this.itemArray,
    this.itemCount,
  }) : super(1);

  factory Module.fromJson(Map map) {
    List <Item> list = [];
    List<List<Item>> listArray = [];
    var c = 0;
    map['items'].forEach((value) {
      if (value is List) {
        List<Item> l = [];
        value.forEach((element) {
          l.add(Item.fromJson(element));
        });
        listArray.add(l);
        c++;
      } else {
        list.add(Item.fromJson(value));
        c++;
      }
    });
    return Module(
      moduleType: map['moduleType'],
      uiType: map['uiType'],
      moduleInfo: ModuleInfo.fromJson(map['moduleInfo']),
      items: list,
      itemArray: listArray,
      itemCount : c,
    );
  }
}