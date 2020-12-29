import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/config/size_config.dart';
import 'package:flutter_redux_pratise/constant/images.dart';
import 'package:flutter_redux_pratise/utils/image_utils.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomeUserState state, Dispatch dispatch, ViewService viewService) {

  Widget gridview() {
    var gridView = GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 1, childAspectRatio: 1.4),
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 40,
                width: 40,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    ImageUtils.getImgPath("icon_mine_sign"),
                  ),
                ),
              ),
              Text("签到",style: TextStyle(fontSize: 13,color: ColorConfig.black),),
            ],
          ),
        );
      },
      itemCount:9,
    );
    return gridView;
  }

  return Container(
    child: Center(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 240.0,
                width: 400,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    ImageUtils.getImgPath("bg_mine_head"),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image(
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          ImageUtils.getImgPath("user_default_header"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "主人，戳我登录",
                          style:
                              TextStyle(fontSize: 25, color: ColorConfig.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, top: 20, right: 30.0),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 30.0,
                              width: 30.0,
                              child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  ImageUtils.getImgPath(
                                      "icon_read_ticket_gift"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "需等待2天",
                                style: TextStyle(fontSize: 12,color: ColorConfig.greyf2f2f2),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "每周定时领取付费漫画阅读劵",
                            style: TextStyle(fontSize: 12,color: ColorConfig.greyf2f2f2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:30.0,right: 30.0,top: 10.0),

                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("---"),
                              Text("我的VIP", style: TextStyle(fontSize: 13,color: ColorConfig.grey),),
                            ],
                          ),
                        Container(
                          width: 1,
                          height: 50,
                          color: ColorConfig.commonBGGrey,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("---"),
                            Text("我的妖气币",style: TextStyle(fontSize: 13,color: ColorConfig.grey),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                gridview(),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
