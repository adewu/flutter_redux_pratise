import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';
import 'package:sqflite/sqflite.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
  });
}

_init(Action action, Context<HomeState> ctx) {
}




