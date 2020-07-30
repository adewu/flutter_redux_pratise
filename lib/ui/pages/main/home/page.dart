import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_pratise/ui/pages/main/home/wrapper.dart';
import 'package:flutter_redux_pratise/ui/widgets/component/banner/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
            wrapper : HomePageWrapper,
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeState>(
                adapter: null,
                slots: <String, Dependent<HomeState>>{
                  BannerComponent.COMPONENT_NAME : BannerConnector() + BannerComponent(),
                }),
            middleware: <Middleware<HomeState>>[
            ],);

}
