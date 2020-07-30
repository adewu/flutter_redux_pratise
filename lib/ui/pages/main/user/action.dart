import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeUserAction { action }

class HomeUserActionCreator {
  static Action onAction() {
    return const Action(HomeUserAction.action);
  }
}
