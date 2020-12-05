
class Author {

  String avatar;
  String name;
  String id;

	Author.fromJsonMap(Map<String, dynamic> map): 
		avatar = map["avatar"],
		name = map["name"],
		id = map["id"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['avatar'] = avatar;
		data['name'] = name;
		data['id'] = id;
		return data;
	}
}
