import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/model/list/RankingItemModel.dart';

class HomeListState implements Cloneable<HomeListState> {

  RankingMainModel rankingMainModel;

  @override
  HomeListState clone() {
    return HomeListState()
        ..rankingMainModel = rankingMainModel;
  }
}

HomeListState initState(Map<String, dynamic> args) {
  return HomeListState()..rankingMainModel = RankingMainModel(rankingList: []);
}
