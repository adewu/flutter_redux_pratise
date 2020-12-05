
class ImHightArr {

  String height;
  String width;

	ImHightArr.fromJsonMap(Map<String, dynamic> map): 
		height = map["height"],
		width = map["width"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['height'] = height;
		data['width'] = width;
		return data;
	}
}
