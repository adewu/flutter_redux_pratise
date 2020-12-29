import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/config/size_config.dart';
import 'package:flutter_redux_pratise/config/space_config.dart';
import 'package:flutter_redux_pratise/model/comic/comic_detail_static/chapter_list.dart';
import 'package:flutter_redux_pratise/ui/items/chapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/button/detail_bottom_btns.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/chip/simple_chip.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/image/common_image.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/navigation/com_bar.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/rank/detail_rank_item.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/text/simple_icon_text.dart';

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
                              child: SimpleIconText(
                                "热度值" +
                                    (state.comicDetailRealTime?.comic
                                            ?.click_total ??
                                        ""),
                                icon: "icon_comic_hot",
                              ),
                            ),
                            Container(
                              margin: SpaceConfig.onlyT6,
                              child: SimpleIconText(
                                "收藏值" +
                                    (state.comicDetailRealTime?.comic
                                            ?.favorite_total ??
                                        ""),
                                icon: "icon_comic_collect",
                              ),
                            ),
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

  Widget newestChapterSection() {
    List<Chapter_list> list = state.comicDetailStatic?.chapter_list;
    if (list != null && list.isNotEmpty) {
      return Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "已完结",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            "(共" + (list.length + 1).toString() + "话)",
                            style: TextStyle(fontSize: 15),
                          )),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        "全部目录",
                        style: TextStyle(fontSize: 15),
                      )),
                ],
              ),
            ),
          ),
          ChapterItem(list[list.length - 1]),
        ],
      );
    } else {
      return Container(
        width: 0,
        height: 0,
      );
    }
  }

  Widget revenueSection() {
    return Padding(
      padding: SpaceConfig.onlyT12,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "本月收入",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            margin : SpaceConfig.onlyT12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SimpleCountIconText(topText: state.comicDetailRealTime?.comic?.monthly_ticket?.toString() ?? "0",text: "月票",iconSize: 20,icon: "icon_comic_detail_ticket_light",),
                SimpleCountIconText(topText: state.comicDetailRealTime?.comic?.gift_total?.toString() ?? "0",text: "礼物",iconSize: 20,icon: "icon_comic_detail_gift",),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget contributionRankSection(){
    return Padding(
      padding: SpaceConfig.onlyT12,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "月票贡献榜",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          ComicDetailRank(),
        ],
      ),
    );
  }

  List<Widget> _showDetail() {
    List<Widget> children = List();
    children.add(topSection());
    children.add(descriptionSection());
    children.add(newestChapterSection());
    children.add(revenueSection());
    children.add(contributionRankSection());
    return children;
  }

  return WillPopScope(
    onWillPop: () async {
      Navigator.pop(viewService.context);
      return false;
    },
    child: Scaffold(
      backgroundColor: ColorConfig.white,
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
            bottom: 0,
            child: DetailBottomBtns(),
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
