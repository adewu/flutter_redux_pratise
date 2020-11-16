import 'package:fish_redux/fish_redux.dart';

class SubscriptionState implements Cloneable<SubscriptionState> {

  @override
  SubscriptionState clone() {
    return SubscriptionState();
  }
}

SubscriptionState initState(Map<String, dynamic> args) {
  return SubscriptionState();
}
