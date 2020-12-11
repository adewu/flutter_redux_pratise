import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/text/simple_icon_text.dart';

class DetailBottomBtns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: ColorConfig.white,
        boxShadow: [
          BoxShadow(blurRadius: 2.0,color: ColorConfig.commonBGGrey)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SimpleUpDownText(
                    "打赏",
                    iconSize: 25,
                    icon: "icon_comic_detail_ticket",
                  ),
                  SimpleUpDownText(
                    "评论",
                    iconSize: 25,
                    icon: "icon_comic_detail_comment",
                  ),
                  SimpleUpDownText(
                    "收藏",
                    iconSize: 25,
                    icon: "icon_comic_detail_collect",
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 70,
            width: 180,
            color: Colors.green,
            alignment: Alignment.center,
            child: Text("阅读 第一话",style: TextStyle(color: ColorConfig.white),),
          )
        ],
      ),
    );
  }
}
