import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/ui/pages/main/user/wrapper.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeUserPage extends Page<HomeUserState, Map<String, dynamic>> {
  HomeUserPage()
      : super(
          wrapper: HomeUserWrapper,
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeUserState>(
              adapter: null, slots: <String, Dependent<HomeUserState>>{}),
          middleware: <Middleware<HomeUserState>>[],
        );
}
