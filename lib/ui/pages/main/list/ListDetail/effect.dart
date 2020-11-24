import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/ui/pages/main/user/action.dart';
import 'action.dart';
import 'state.dart';

Effect<ListDetailState> buildEffect() {
  return combineEffects(<Object, Effect<ListDetailState>>{
    ListDetailAction.action: _onAction
  });
}

void _onAction(Action action, Context<ListDetailState> ctx) {
  println("ListDetailState  _onAction");
  ctx.broadcast(HomeUserActionCreator.onAction());
}
