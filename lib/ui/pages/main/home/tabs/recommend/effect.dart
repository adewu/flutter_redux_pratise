import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RecommendState> buildEffect() {
  return combineEffects(<Object, Effect<RecommendState>>{
    RecommendAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RecommendState> ctx) {
}
