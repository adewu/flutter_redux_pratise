import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class RecommendMainModel {
  var galleryItems;
  var textItems;
  List<ComicMainModel> comicLists;

  RecommendMainModel({
    this.galleryItems,
    this.textItems,
    this.comicLists,
  });

  factory RecommendMainModel.fromJson(Map map) {
    print(map);
    var arr = List<ComicMainModel>();
    map['comicLists'].forEach((value) {
       var e = ComicMainModel.fromJson(value);
      arr.add(e);
    });
    return RecommendMainModel(
        galleryItems: map['galleryItems'],
        textItems: map['textItems'],
        comicLists: arr);
  }
}

class ComicMainModel extends Item{
  // var comicType;
  // var canedit;
  // var sortId;
  // var titleIconUrl;
  String newTitleIconUrl;
  String description;
  String itemTitle;

  String argName;
  int argValue;
  int argType;
  List<ComicItemModel> comics;

  ComicMainModel({
    // this.comicType,
    // this.canedit,
    // this.sortId,
    // this.titleIconUrl,
    this.newTitleIconUrl,
    this.description,
    this.itemTitle,
    this.argName,
    this.argValue,
    this.argType,
    this.comics,
  }) : super(0);

  factory ComicMainModel.fromJson(Map map) {
    print('解析ComicMainModel $map');
    List <ComicItemModel> list = [];
    comics: map['comics'].forEach((value) {
      ComicItemModel comicItemModel =  ComicItemModel.fromJson(value);
      list.add(comicItemModel);
    });
    return ComicMainModel(
      // comicType: map['comicType'],
      // canedit: map['canedit'],
      // sortId: map['sortId'],
      // titleIconUrl: map['titleIconUrl'],
      newTitleIconUrl: map['newTitleIconUrl'],
      description: map['description'],
      itemTitle: map['itemTitle'],
      argName: map['argName'],
      argValue: map['argValue'],
      argType: map['argType'],
      comics: list,
    );
  }
}

class ComicItemModel {
  String name = '';
  String cover = '';
  String subTitle = '';
  String description = '';
  String cornerInfo = '';
  String short_description = '';
  String author_name = '';
  List<String> tags;
  // String is_vip = '';
  // String is_vip = '';

  ComicItemModel({
    this.name,
    this.cover,
    this.subTitle,
    this.description,
    this.cornerInfo,
    this.short_description,
    this.author_name,
    this.tags,
    // this.is_vip,
  });

  factory ComicItemModel.fromJson(Map map) {
    return ComicItemModel(
      name: map['name'],
      cover: map['cover'],
      subTitle: map['subTitle'],
      description: map['description'],
      cornerInfo: map['cornerInfo'],
      short_description: map['short_description'],
      author_name: map['author_name'],
      tags:(map['tags'] as List)?.map((e) => e as String)?.toList(),
      // is_vip: map['is_vip'],
    );
  }
}
