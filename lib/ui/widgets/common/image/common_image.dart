import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/config/SpaceConfig.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/config/font_config.dart';
import 'package:flutter_redux_pratise/config/size_config.dart';
import 'package:flutter_redux_pratise/constant/images.dart';
import 'package:flutter_redux_pratise/utils/log_util.dart';
import 'package:flutter_redux_pratise/utils/utils.dart';

class Img extends StatelessWidget {
  String url;
  String placeHolderImg;
  double width;
  double height;
  GestureTapCallback clickCallBack;

  Img(this.url, {
    this.width,
    this.height,
    this.clickCallBack,
  });

  _placeHolder(String placeHolder) {
    if(placeHolderImg != null) {
      return Image(
        fit: BoxFit.contain,
        image: AssetImage(
          Utils.getImgPath(placeHolder),
        ),
      );
    }else{
      return Container(
        color: ColorConfig.greyf2f2f2,
        child: Center(
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage(
              Utils.getImgPath("icon_u17_drawee_default"),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: GestureDetector(
          onTap: clickCallBack,
          child: CachedNetworkImage(
            imageUrl: url ?? "",
            placeholder: (context, url) => _placeHolder(placeHolderImg ),
            errorWidget: (context, url, error) =>
                _placeHolder(placeHolderImg ),
            fit: BoxFit.cover,
          )),
    );
  }
}
