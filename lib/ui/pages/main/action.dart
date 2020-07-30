import 'package:fish_redux/fish_redux.dart';

enum MainAction { switchTab }

class MainActionCreator {

  static Action onSwitchTabAction(int index) {
    return Action(MainAction.switchTab,payload: index);
  }

}
