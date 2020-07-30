import 'package:fish_redux/fish_redux.dart';

class HomeUserState implements Cloneable<HomeUserState> {

  @override
  HomeUserState clone() {
    return HomeUserState();
  }
}

HomeUserState initState(Map<String, dynamic> args) {
  return HomeUserState();
}
