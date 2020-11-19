import 'dart:math';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/smart_listview.dart';
import 'package:flutter_redux_pratise/utils/log_util.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RecommendState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: SmartListView(
      adapter: state.adapter,
      scrollListener: (pixels) {
        Log.info(pixels);
        int r;
        if (pixels <= 0) {
          r = 0;
        } else if (pixels > 255) {
          r = 255;
        } else {
          r = pixels;
        }

        if(pixels < 255 * 2) {
          dispatch(RecommendActionCreator.onListScroll(r));
        }
      },
      refreshListener: () {
        dispatch(RecommendActionCreator.onRefresh());
      },
    ),
  );
}
