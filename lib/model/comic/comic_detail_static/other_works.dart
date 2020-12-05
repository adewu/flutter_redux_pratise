
class OtherWorks {

  String comicId;
  String coverUrl;
  String name;
  String passChapterNum;

	OtherWorks.fromJsonMap(Map<String, dynamic> map): 
		comicId = map["comicId"],
		coverUrl = map["coverUrl"],
		name = map["name"],
		passChapterNum = map["passChapterNum"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['comicId'] = comicId;
		data['coverUrl'] = coverUrl;
		data['name'] = name;
		data['passChapterNum'] = passChapterNum;
		return data;
	}
}
