import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/ui/pages/main/user/action.dart';
import 'action.dart';
import 'state.dart';

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    MainAction.action: _onAction
  });
}

void _onAction(Action action, Context<MainState> ctx) {
  println("main");
  ctx.broadcast(HomeUserActionCreator.onAction());
}
