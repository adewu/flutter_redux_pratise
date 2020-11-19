import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/indicator/top_text_indicator.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  _createView() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: PageView(
              controller: state.pageController,
              children: state.pages,
              onPageChanged: (index){
                dispatch(HomeActionCreator.onPageChange(index));
              },
            ),
          ),
          Container(
            color: getTopSectionColor(state),
            height: 80,
            child: Stack(
              children: <Widget>[
                TopTextIndicator(state.indicators, (pos) {},scrollPixels : state.curPixels,curPageIndex: state.currentPageIndex,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                      ),
                      child:
                          IconButton(icon: Icon(Icons.search), onPressed: null),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  return _createView();
}

Color getTopSectionColor(HomeState state) {
  if(state.currentPageIndex == 0) {
    return Colors.white.withAlpha(state.curPixels);
  }else{
    return Colors.white.withAlpha(255);
  }
}
