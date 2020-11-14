import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SubscriptionState> buildReducer() {
  return asReducer(
    <Object, Reducer<SubscriptionState>>{
      SubscriptionAction.action: _onAction,
    },
  );
}

SubscriptionState _onAction(SubscriptionState state, Action action) {
  final SubscriptionState newState = state.clone();
  return newState;
}
