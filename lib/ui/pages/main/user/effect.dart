import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeUserState> buildEffect() {
  return combineEffects(<Object, Effect<HomeUserState>>{
    HomeUserAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HomeUserState> ctx) {
  println("effect");
}
