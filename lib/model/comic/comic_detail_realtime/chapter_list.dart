
class Chapter_list {

  String vip_images;
  String chapter_id;
  int is_view;
  String buyed;
  String buy_price;
  int is_download;
  int read_state;
  int is_free;

	Chapter_list.fromJsonMap(Map<String, dynamic> map): 
		vip_images = map["vip_images"],
		chapter_id = map["chapter_id"],
		is_view = map["is_view"],
		buyed = map["buyed"],
		buy_price = map["buy_price"],
		is_download = map["is_download"],
		read_state = map["read_state"],
		is_free = map["is_free"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['vip_images'] = vip_images;
		data['chapter_id'] = chapter_id;
		data['is_view'] = is_view;
		data['buyed'] = buyed;
		data['buy_price'] = buy_price;
		data['is_download'] = is_download;
		data['read_state'] = read_state;
		data['is_free'] = is_free;
		return data;
	}
}
