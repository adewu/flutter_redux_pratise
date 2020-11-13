import 'package:flutter/material.dart';

class RecommondMainModel {
  var galleryItems;
  var textItems;
  List<ComicMainModel> comicLists;

  RecommondMainModel({
    this.galleryItems,
    this.textItems,
    this.comicLists,
  });

  factory RecommondMainModel.fromJson(Map map) {
    print(map);
    var arr = List<ComicMainModel>();
    map['comicLists'].forEach((value) {
       var e = ComicMainModel.fromJson(value);
      arr.add(e);
    });
    return RecommondMainModel(
        galleryItems: map['galleryItems'],
        textItems: map['textItems'],
        comicLists: arr);
  }
}

class ComicMainModel {
  // var comicType;
  // var canedit;
  // var sortId;
  // var titleIconUrl;
  // var newTitleIconUrl;
  String description;
  String itemTitle;

  // var argName;
  // var argValue;
  // var argType;
  List<ComicItemModel> comics;

  ComicMainModel({
    // this.comicType,
    // this.canedit,
    // this.sortId,
    // this.titleIconUrl,
    // this.newTitleIconUrl,
    this.description,
    this.itemTitle,
    // this.argName,
    // this.argValue,
    // this.argType,
    this.comics,
  });

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
      // newTitleIconUrl: map['newTitleIconUrl'],
      description: map['description'],
      itemTitle: map['itemTitle'],
      // argName: map['argName'],
      // argValue: map['argValue'],
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
  // String is_vip = '';

  ComicItemModel({
    this.name,
    this.cover,
    this.subTitle,
    this.description,
    this.cornerInfo,
    this.short_description,
    this.author_name,
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
      // is_vip: map['is_vip'],
    );
  }
}
