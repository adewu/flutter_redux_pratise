import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/ui/pages/main/home/tabs/rank/wrapper.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RankPage extends Page<RankState, Map<String, dynamic>> {
  RankPage()
      : super(
            wrapper: HomeRankPageWrapper,
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<RankState>(
                adapter: null,
                slots: <String, Dependent<RankState>>{
                }),
            middleware: <Middleware<RankState>>[
            ],);

}
