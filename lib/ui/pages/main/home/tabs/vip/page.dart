import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'wrapper.dart';

class VIPPage extends Page<VIPState, Map<String, dynamic>> {
  VIPPage()
      : super(
            wrapper:HomeVIPPageWrapper,
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<VIPState>(
                adapter: null,
                slots: <String, Dependent<VIPState>>{
                }),
            middleware: <Middleware<VIPState>>[
            ],);

}
