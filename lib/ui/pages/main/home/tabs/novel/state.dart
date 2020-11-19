import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/model/list/RecommendMainModel.dart';

import 'novel_adapter.dart';

class NovelState implements Cloneable<NovelState> {

  RecommendMainModel model;
  NovelAdapter adapter;

  @override
  NovelState clone() {
    return NovelState()
      .. model = model
      .. adapter = adapter;
  }
}

NovelState initState(Map<String, dynamic> args) {
  return NovelState() .. adapter = NovelAdapter();
}
