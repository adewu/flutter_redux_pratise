import 'package:flutter_redux_pratise/model/comic/comic_detail_static/comic.dart';
import 'package:flutter_redux_pratise/model/comic/comic_detail_static/chapter_list.dart';
import 'package:flutter_redux_pratise/model/comic/comic_detail_static/other_works.dart';

class ComicDetailStatic {

  Comic comic;
  List<Chapter_list> chapter_list;
  List<OtherWorks> otherWorks;

	ComicDetailStatic.fromJsonMap(Map<String, dynamic> map): 
		comic = Comic.fromJsonMap(map["comic"]),
		chapter_list = List<Chapter_list>.from(map["chapter_list"].map((it) => Chapter_list.fromJsonMap(it))),
		otherWorks = List<OtherWorks>.from(map["otherWorks"].map((it) => OtherWorks.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['comic'] = comic == null ? null : comic.toJson();
		data['chapter_list'] = chapter_list != null ? 
			this.chapter_list.map((v) => v.toJson()).toList()
			: null;
		data['otherWorks'] = otherWorks != null ? 
			this.otherWorks.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
