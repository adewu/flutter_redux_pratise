import 'package:fish_redux/fish_redux.dart';

class RecommendState implements Cloneable<RecommendState> {

  @override
  RecommendState clone() {
    return RecommendState();
  }
}

RecommendState initState(Map<String, dynamic> args) {
  return RecommendState();
}
