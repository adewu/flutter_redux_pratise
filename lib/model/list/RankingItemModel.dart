class RankingMainModel {
  List<RankingItemModel> rankingList;
  String recommendSearch;

  RankingMainModel({this.rankingList, this.recommendSearch});

  factory RankingMainModel.fromJson(Map map) {
    List<RankingItemModel> list = [];
    dynamic listData = map['rankingList'];
    if (listData is List) {
      listData.forEach((element) {
        RankingItemModel itemModel = RankingItemModel.fromJson(element);
        list.add(itemModel);
      });
    }
    return RankingMainModel(recommendSearch: map['String'], rankingList: list);
  }
}

class RankingItemModel {
  int sortId;
  String sortName;
  bool isLike;
  String cover;
  bool canEdit;
  String argName;
  int argValue;
  int argCon;

  RankingItemModel(
      {this.sortId,
      this.sortName,
      this.isLike,
      this.cover,
      this.canEdit,
      this.argName,
      this.argValue,
      this.argCon});

  factory RankingItemModel.fromJson(Map map) {
    return RankingItemModel(
      sortId: map['sortId'],
      sortName: map['sortName'],
      isLike: map['isLike'],
      cover: map['cover'],
      canEdit: map['canEdit'],
      argName: map['argName'],
      argValue: map['argValue'],
      argCon: map['argCon'],
    );
  }
}
