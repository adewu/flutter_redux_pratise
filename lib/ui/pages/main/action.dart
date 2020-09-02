import 'package:fish_redux/fish_redux.dart';

enum MainAction { switchTab,action }

class MainActionCreator {

  static Action onSwitchTabAction(int index) {
    return Action(MainAction.switchTab,payload: index);
  }

  static Action onAction() {
    return const Action(MainAction.action);
  }

}
