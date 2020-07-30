import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeUserState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeUserState>>{
      HomeUserAction.action: _onAction,
    },
  );
}

HomeUserState _onAction(HomeUserState state, Action action) {
  final HomeUserState newState = state.clone();
  return newState;
}
