import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/model/comic/comic_detail_realtime/ComicDetailRealTime.dart';
import 'package:flutter_redux_pratise/model/comic/comic_detail_static/ComicDetailStatic.dart';

class ComicDetailState implements Cloneable<ComicDetailState> {

  int comicId;
  ComicDetailStatic comicDetailStatic;
  ComicDetailRealTime comicDetailRealTime;

  @override
  ComicDetailState clone() {
    return ComicDetailState() ..comicId = comicId
    ..comicDetailStatic = comicDetailStatic
    ..comicDetailRealTime = comicDetailRealTime;
  }
}

ComicDetailState initState(Map<String, dynamic> args) {
  int comicId = 186785;
  if(args != null){
    comicId = args["comicId"];
  }
  return ComicDetailState() ..comicId = comicId;
}
