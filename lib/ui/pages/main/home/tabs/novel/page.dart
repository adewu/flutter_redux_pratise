import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'wrapper.dart';

class NovelPage extends Page<NovelState, Map<String, dynamic>> {
  NovelPage()
      : super(
            wrapper:HomeNovelPageWrapper,
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<NovelState>(
                adapter: null,
                slots: <String, Dependent<NovelState>>{
                }),
            middleware: <Middleware<NovelState>>[
            ],);

}
