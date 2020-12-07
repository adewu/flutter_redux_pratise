import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/config/size_config.dart';
import 'package:flutter_redux_pratise/config/space_config.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/chip/simple_chip.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/image/common_image.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/navigation/com_bar.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ComicDetailState state, Dispatch dispatch, ViewService viewService) {
  Widget topSection() {
    return Container(
      height: 280,
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
          ),
          Container(
            height: 220,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: ColorConfig.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                    ),
                  ),
                ),
                Positioned(
                  left: SizeConfig.content15,
                  child: Row(
                    children: <Widget>[
                      Img(
                        state.comicDetailStatic?.comic?.cover ?? "",
                        width: 160,
                        height: 220,
                        radius: 8,
                        borderWidth: 4,
                      ),
                      Container(
                        height: 220,
                        margin: SpaceConfig.onlyL12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: SpaceConfig.onlyT6,
                                child: Text(
                                  state.comicDetailStatic?.comic?.name ?? "",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: ColorConfig.comTextGrey1,
                                      decoration: TextDecoration.none),
                                )),
                            Container(
                                margin: SpaceConfig.onlyT30,
                                child: Text(
                                  state.comicDetailStatic?.comic?.author
                                          ?.name ??
                                      "",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: ColorConfig.comTextGrey1,
                                      decoration: TextDecoration.none),
                                )),
                            SimpleChip(
                                state.comicDetailStatic?.comic?.theme_ids ??
                                    List<String>()), //theme_ids
                            Container(
                                margin: SpaceConfig.onlyT20,
                                child: Text(
                                  "热度值" +
                                      (state.comicDetailRealTime?.comic
                                              ?.click_total ??
                                          ""),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: ColorConfig.comTextGrey,
                                      decoration: TextDecoration.none),
                                )),
                            Container(
                                margin: SpaceConfig.onlyT6,
                                child: Text(
                                  "收藏值" +
                                      (state.comicDetailRealTime?.comic
                                              ?.favorite_total ??
                                          ""),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: ColorConfig.comTextGrey,
                                      decoration: TextDecoration.none),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                  // child: CachedNetworkImage(
                  //   height: 220,
                  //   width: 150,
                  //   imageUrl: state.comicDetailStatic?.comic?.cover ?? "" ,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget descriptionSection() {
    return Container(
      color: ColorConfig.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              state.comicDetailStatic?.comic?.description ?? "",
              style: TextStyle(fontSize: 16, color: ColorConfig.comTextGrey1),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _showDetail() {
    List<Widget> children = List();
    children.add(topSection());
    children.add(descriptionSection());
    return children;
  }

  return WillPopScope(
    onWillPop: () async {
      Navigator.pop(viewService.context);
      return false;
    },
    child: Scaffold(
      body: Stack(
        alignment: Alignment.topCenter, //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          //background
          Positioned(
            left: 0,
            right: 0,
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: state.comicDetailStatic?.comic?.wideCover ?? "",
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: new Container(
                      color: Colors.white.withOpacity(0.1),
                    ),
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
