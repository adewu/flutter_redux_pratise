import 'package:flutter_redux_pratise/model/comic/comic_detail_static/classify_tags.dart';
import 'package:flutter_redux_pratise/model/comic/comic_detail_static/author.dart';

class Comic {

  String name;
  String comic_id;
  String short_description;
  int accredit;
  String cover;
	String is_vip;
	String type;
  String ori;
  List<String> theme_ids;
  String series_status;
  int last_update_time;
  String description;
  String cate_id;
  int status;
  String thread_id;
  String last_update_week;
  String wideCover;
  List<ClassifyTags> classifyTags;
  int is_week;
  String comic_color;
  Author author;
  int is_dub;

	Comic.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		comic_id = map["comic_id"],
		short_description = map["short_description"],
		accredit = map["accredit"],
		cover = map["cover"],
		is_vip = map["is_vip"],
		type = map["type"],
		ori = map["ori"],
		theme_ids = List<String>.from(map["theme_ids"]),
		series_status = map["series_status"],
		last_update_time = map["last_update_time"],
		description = map["description"],
		cate_id = map["cate_id"],
		status = map["status"],
		thread_id = map["thread_id"],
		last_update_week = map["last_update_week"],
		wideCover = map["wideCover"],
		classifyTags = List<ClassifyTags>.from(map["classifyTags"].map((it) => ClassifyTags.fromJsonMap(it))),
		is_week = map["is_week"],
		comic_color = map["comic_color"],
		author = Author.fromJsonMap(map["author"]),
		is_dub = map["is_dub"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['comic_id'] = comic_id;
		data['short_description'] = short_description;
		data['accredit'] = accredit;
		data['cover'] = cover;
		data['is_vip'] = is_vip;
		data['type'] = type;
		data['ori'] = ori;
		data['theme_ids'] = theme_ids;
		data['series_status'] = series_status;
		data['last_update_time'] = last_update_time;
		data['description'] = description;
		data['cate_id'] = cate_id;
		data['status'] = status;
		data['thread_id'] = thread_id;
		data['last_update_week'] = last_update_week;
		data['wideCover'] = wideCover;
		data['classifyTags'] = classifyTags != null ? 
			this.classifyTags.map((v) => v.toJson()).toList()
			: null;
		data['is_week'] = is_week;
		data['comic_color'] = comic_color;
		data['author'] = author == null ? null : author.toJson();
		data['is_dub'] = is_dub;
		return data;
	}
}
