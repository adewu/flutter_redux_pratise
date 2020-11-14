import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'wrapper.dart';

class RecommendPage extends Page<RecommendState, Map<String, dynamic>> {
  RecommendPage()
      : super(
            wrapper: HomeRecommendPageWrapper,
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<RecommendState>(
                adapter: null,
                slots: <String, Dependent<RecommendState>>{
                }),
            middleware: <Middleware<RecommendState>>[
            ],);

}
