import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RankAction { action }

class RankActionCreator {
  static Action onAction() {
    return const Action(RankAction.action);
  }
}
