import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SubscriptionAction { action }

class SubscriptionActionCreator {
  static Action onAction() {
    return const Action(SubscriptionAction.action);
  }
}
