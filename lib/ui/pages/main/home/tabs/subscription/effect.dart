import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<SubscriptionState> buildEffect() {
  return combineEffects(<Object, Effect<SubscriptionState>>{
    SubscriptionAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SubscriptionState> ctx) {
}
