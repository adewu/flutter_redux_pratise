
class ClassifyTags {

  String name;
  String argName;
  int argVal;

	ClassifyTags.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		argName = map["argName"],
		argVal = map["argVal"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['argName'] = argName;
		data['argVal'] = argVal;
		return data;
	}
}
