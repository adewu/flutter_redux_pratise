import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MainState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainState>>{
      MainAction.switchTab: _onSwitchTabAction,
    },
  );
}

MainState _onSwitchTabAction(MainState state, Action action) {
  state.currentPageIndex = action.payload;

  final MainState newState = state.clone();
  return newState;
}
