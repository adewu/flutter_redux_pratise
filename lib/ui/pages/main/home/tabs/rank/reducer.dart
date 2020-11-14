import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RankState> buildReducer() {
  return asReducer(
    <Object, Reducer<RankState>>{
      RankAction.action: _onAction,
    },
  );
}

RankState _onAction(RankState state, Action action) {
  final RankState newState = state.clone();
  return newState;
}
