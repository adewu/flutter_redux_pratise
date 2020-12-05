import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ComicDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<ComicDetailState>>{
      ComicDetailAction.updateUI: _updateUI,
    },
  );
}

ComicDetailState _updateUI(ComicDetailState state, Action action) {
  final ComicDetailState newState = state.clone();
  return newState;
}
