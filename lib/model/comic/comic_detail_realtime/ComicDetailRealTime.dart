import 'package:flutter_redux_pratise/model/comic/comic_detail_realtime/comic.dart';
import 'package:flutter_redux_pratise/model/comic/comic_detail_realtime/chapter_list.dart';

class ComicDetailRealTime {

  Comic comic;
  List<Chapter_list> chapter_list;

	ComicDetailRealTime.fromJsonMap(Map<String, dynamic> map): 
		comic = Comic.fromJsonMap(map["comic"]),
		chapter_list = List<Chapter_list>.from(map["chapter_list"].map((it) => Chapter_list.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['comic'] = comic == null ? null : comic.toJson();
		data['chapter_list'] = chapter_list != null ? 
			this.chapter_list.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
