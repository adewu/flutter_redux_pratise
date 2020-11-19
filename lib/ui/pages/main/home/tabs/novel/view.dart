import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/smart_listview.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(NovelState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(top:80.0),
      child: SmartListView(
        adapter: state.adapter,
        refreshListener: () {
          dispatch(NovelActionCreator.onRefresh());
        },
      ),
    ),
  );
}
