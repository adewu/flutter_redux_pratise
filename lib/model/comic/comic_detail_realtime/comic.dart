
class Comic {

  String comic_id;
  String user_id;
  String status;
  String click_total;
  int total_ticket;
  int comment_total;
  int total_tucao;
  String favorite_total;
  String gift_total;
  int monthly_ticket;
  double vip_discount;
  bool is_vip_free;
  int is_free;
  bool is_vip_buy;
  int is_buy_action;
  int is_auto_buy;

	Comic.fromJsonMap(Map<String, dynamic> map): 
		comic_id = map["comic_id"],
		user_id = map["user_id"],
		status = map["status"],
		click_total = map["click_total"],
		total_ticket = map["total_ticket"],
		comment_total = map["comment_total"],
		total_tucao = map["total_tucao"],
		favorite_total = map["favorite_total"],
		gift_total = map["gift_total"],
		monthly_ticket = map["monthly_ticket"],
		vip_discount = map["vip_discount"],
		is_vip_free = map["is_vip_free"],
		is_free = map["is_free"],
		is_vip_buy = map["is_vip_buy"],
		is_buy_action = map["is_buy_action"],
		is_auto_buy = map["is_auto_buy"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['comic_id'] = comic_id;
		data['user_id'] = user_id;
		data['status'] = status;
		data['click_total'] = click_total;
		data['total_ticket'] = total_ticket;
		data['comment_total'] = comment_total;
		data['total_tucao'] = total_tucao;
		data['favorite_total'] = favorite_total;
		data['gift_total'] = gift_total;
		data['monthly_ticket'] = monthly_ticket;
		data['vip_discount'] = vip_discount;
		data['is_vip_free'] = is_vip_free;
		data['is_free'] = is_free;
		data['is_vip_buy'] = is_vip_buy;
		data['is_buy_action'] = is_buy_action;
		data['is_auto_buy'] = is_auto_buy;
		return data;
	}
}
