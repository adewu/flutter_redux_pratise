import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/navigation/com_bar.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ComicDetailState state, Dispatch dispatch, ViewService viewService) {



  Widget topSection(){
    return Container(
      height: 500,
      child: Column(
        children: <Widget>[
          Container(height: 60,),
          Container(
            height: 440,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  child: CachedNetworkImage(
                    height: 440,
                    width: 100,
                    imageUrl: state.comicDetailStatic?.comic?.cover ?? "" ,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  List<Widget> _showDetail() {
    List<Widget> children = List();
    children.add(topSection());
    return children;
  }


  return WillPopScope(
    onWillPop: () async {
      Navigator.pop(viewService.context);
      return false;
    },
    child: Container(
      child: Stack(
        alignment:Alignment.topCenter , //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          //background
          Positioned(
            left: 0,
            right: 0,
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: state.comicDetailStatic?.comic?.wideCover ?? "" ,
                  fit: BoxFit.cover,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: new Container(
                    color: Colors.white.withOpacity(0.1),
                  ),
                )
              ],
            ),
          ),
          Positioned.fill(
            child: ListView(
              children: _showDetail(),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: CommonBar(),
          ),
          //listview
        ],
      ),
    ),
  );
}

