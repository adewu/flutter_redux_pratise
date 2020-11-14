import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/ui/pages/main/action.dart';
import 'package:flutter_redux_pratise/ui/pages/main/user/action.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/indicator/top_text_indicator.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/smart_listview.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/state/api_state_widget.dart';
import 'package:flutter_redux_pratise/ui/widgets/component/banner/component.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  _createView() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              height: 80,
              child: Stack(
                children: <Widget>[
                  TopTextIndicator(state.indicators,(pos){

                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 40,),
                        child: IconButton(icon: Icon(Icons.search), onPressed: null),
                      ),
                    ],
                  ),
                ],
              )),
          Expanded(
            child: Container(
              child: PageView(
                controller: state.pageController,
                children: state.pages,
              ),
            ),
          ),
        ],
      ),
    );
  }

  return _createView();
}
