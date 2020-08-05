import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/state/api_state_widget.dart';
import 'package:flutter_redux_pratise/ui/widgets/component/banner/component.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return ApiStateWidget(
      state.currentState,
      "",
      () {},
      Container(
        child: ListView(
          children: <Widget>[
            viewService.buildComponent(BannerComponent.COMPONENT_NAME)
          ],
        ),
      ));
}
