import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<NovelState> buildReducer() {
  return asReducer(
    <Object, Reducer<NovelState>>{
      NovelAction.updateUI: _onUpdateUI,
    },
  );
}


NovelState _onUpdateUI(NovelState state, Action action) {
  final NovelState newState = state.clone();
  return newState;
}