import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'wrapper.dart';

class SubscriptionPage extends Page<SubscriptionState, Map<String, dynamic>> {
  SubscriptionPage()
      : super(
            wrapper:HomeSubscriptionPageWrapper,
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SubscriptionState>(
                adapter: null,
                slots: <String, Dependent<SubscriptionState>>{
                }),
            middleware: <Middleware<SubscriptionState>>[
            ],);

}
