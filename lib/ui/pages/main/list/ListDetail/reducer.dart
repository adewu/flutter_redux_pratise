import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ListDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<ListDetailState>>{
      ListDetailAction.refresh: _onRefreshAction,
    },
  );
}

ListDetailState _onRefreshAction(ListDetailState state, Action action) {
  state.currentPageIndex = action.payload;
  final ListDetailState newState = state.clone();
  return newState;
}
