import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/model/list/RecommendMainModel.dart';
import 'package:flutter_redux_pratise/ui/pages/main/home/tabs/recommend/recommend_adapter.dart';

class RecommendState implements Cloneable<RecommendState> {

  RecommendMainModel model;
  RecommendAdapter adapter;

  @override
  RecommendState clone() {
    return RecommendState()
    .. model = model
    .. adapter = adapter;
  }
}

RecommendState initState(Map<String, dynamic> args) {
  return RecommendState() ..adapter = RecommendAdapter() ;
}
