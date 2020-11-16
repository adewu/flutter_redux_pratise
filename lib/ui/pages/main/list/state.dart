import 'package:fish_redux/fish_redux.dart';

class HomeListState implements Cloneable<HomeListState> {



  @override
  HomeListState clone() {
    return HomeListState();
  }
}

HomeListState initState(Map<String, dynamic> args) {
  return HomeListState();
}
