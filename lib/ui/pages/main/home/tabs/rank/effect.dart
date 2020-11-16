import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RankState> buildEffect() {
  return combineEffects(<Object, Effect<RankState>>{
    RankAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RankState> ctx) {
}
