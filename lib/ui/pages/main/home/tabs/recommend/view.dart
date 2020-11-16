import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/smart_listview.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(RecommendState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child:SmartListView(
      adapter: state.adapter,
      refreshListener: (){
        dispatch(RecommendActionCreator.onRefresh());
      },
    ),
  );
}
