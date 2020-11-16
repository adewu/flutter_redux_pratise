import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecommendState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecommendState>>{
      RecommendAction.action: _onAction,
    },
  );
}

RecommendState _onAction(RecommendState state, Action action) {
  final RecommendState newState = state.clone();
  return newState;
}
