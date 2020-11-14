import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<VIPState> buildReducer() {
  return asReducer(
    <Object, Reducer<VIPState>>{
      VIPAction.action: _onAction,
    },
  );
}

VIPState _onAction(VIPState state, Action action) {
  final VIPState newState = state.clone();
  return newState;
}
