import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.action: _onAction,
      HomeAction.pageChange : _pageChanged,
    },
  );
}

HomeState _pageChanged(HomeState state, Action action) {
  state.indicators.selected = action.payload;

  final HomeState newState = state.clone();
  return newState;
}

HomeState _onAction(HomeState state, Action action) {
  final HomeState newState = state.clone();
  return newState;
}
