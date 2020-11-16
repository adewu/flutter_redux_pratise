import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<VIPState> buildEffect() {
  return combineEffects(<Object, Effect<VIPState>>{
    VIPAction.action: _onAction,
  });
}

void _onAction(Action action, Context<VIPState> ctx) {
}
