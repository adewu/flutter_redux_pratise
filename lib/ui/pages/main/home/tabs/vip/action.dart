import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum VIPAction { action }

class VIPActionCreator {
  static Action onAction() {
    return const Action(VIPAction.action);
  }
}
