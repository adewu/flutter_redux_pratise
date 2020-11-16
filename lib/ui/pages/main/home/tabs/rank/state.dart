import 'package:fish_redux/fish_redux.dart';

class RankState implements Cloneable<RankState> {

  @override
  RankState clone() {
    return RankState();
  }
}

RankState initState(Map<String, dynamic> args) {
  return RankState();
}
