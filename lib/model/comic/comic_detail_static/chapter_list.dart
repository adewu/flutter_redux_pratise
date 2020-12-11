import 'package:flutter_redux_pratise/model/comic/comic_detail_static/im_hight_arr.dart';

class Chapter_list {

  String name;
  String image_total;
  String chapter_id;
  String type;
  String price;
  String size;
  int pass_time;
  String release_time;
  String zip_high_webp;
  String crop_zip_size;
  int is_new;
  bool has_locked_image;
  // List<List<ImHightArr>> imHightArr;
  int countImHightArr;
  String cover;

	Chapter_list.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		image_total = map["image_total"],
		chapter_id = map["chapter_id"],
		type = map["type"],
		price = map["price"],
		size = map["size"],
		pass_time = map["pass_time"],
		release_time = map["release_time"],
		zip_high_webp = map["zip_high_webp"],
		crop_zip_size = map["crop_zip_size"],
		is_new = map["is_new"],
		has_locked_image = map["has_locked_image"],
		// imHightArr = List<ImHightArr>.from(map["imHightArr"].map((it) => ImHightArr.fromJsonMap(it))),
		countImHightArr = map["countImHightArr"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['image_total'] = image_total;
		data['chapter_id'] = chapter_id;
		data['type'] = type;
		data['price'] = price;
		data['size'] = size;
		data['pass_time'] = pass_time;
		data['release_time'] = release_time;
		data['zip_high_webp'] = zip_high_webp;
		data['crop_zip_size'] = crop_zip_size;
		data['is_new'] = is_new;
		data['has_locked_image'] = has_locked_image;
		// data['imHightArr'] = imHightArr != null ?
		// 	this.imHightArr.map((v) => v.toJson()).toList()
		// 	: null;
		data['countImHightArr'] = countImHightArr;
		return data;
	}
}
