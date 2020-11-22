import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeListState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeListState>>{
      HomeListAction.updateUi: _updateUi,
    },
  );
}

HomeListState _updateUi(HomeListState state, Action action) {
  print('调用UI更新的方法');
  final HomeListState newState = state.clone();
  return newState;
}
