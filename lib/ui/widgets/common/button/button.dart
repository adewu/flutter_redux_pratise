import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/config/size_config.dart';
import 'package:flutter_redux_pratise/config/space_config.dart';

class ConfirmButton extends StatelessWidget {
  String content;

  bool enable;
  bool isNeedBorderRadius = false;
  double radius = 8.0;
  double height;
  double fontSize;
  bool bold = true;
  double width;

  GestureTapCallback callback;

  bool needMarginLR;

  ConfirmButton(
      {this.content,
      this.enable,
      this.callback,
      this.needMarginLR,
      this.width,
      this.height,
      this.fontSize,
      this.bold,
      this.isNeedBorderRadius,
      this.radius});

  Color _getColor() {
    if (enable == null) {
      enable = false;
    }
    if (enable) {
      return ColorConfig.themeYellow;
    } else {
      return ColorConfig.xCCCCCC;
    }
  }

  Color _getTextColor() {
    if (enable == null) {
      enable = false;
    }
    if (enable) {
      return ColorConfig.x222222;
    } else {
      return ColorConfig.x999999;
    }
  }

  EdgeInsetsGeometry _getMargin() {
    if (needMarginLR == null) {
      needMarginLR = false;
    }
    if (needMarginLR) {
      return SpaceConfig.onlyLR12;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return width != null
        ? GestureDetector(
            onTap: callback,
            child: Container(
              decoration: ShapeDecoration(
                color: _getColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                        this.isNeedBorderRadius ?? false ? this.radius : 0.0),
                  ),
                ),
              ),
              width: width,
              margin: _getMargin(),
              padding: EdgeInsets.only(left: 12.0, right: 12.0),
              height: height ?? SizeConfig.s44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    content,
                    style: new TextStyle(
                        decoration: TextDecoration.none,
                        color: _getTextColor(),
                        fontSize: fontSize ?? SizeConfig.s14,
                        letterSpacing: SizeConfig.s3,
                        fontWeight: (bold == null ? true : bold)
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                ],
              ),
            ),
          )
        : GestureDetector(
            onTap: callback,
            child: Container(
              decoration: ShapeDecoration(
                color: _getColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                        this.isNeedBorderRadius ?? false ? this.radius : 0.0),
                  ),
                ),
              ),
              margin: _getMargin(),
              padding: EdgeInsets.only(left: 12.0, right: 12.0),
              height: height ?? SizeConfig.s44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    content,
                    style: new TextStyle(
                        decoration: TextDecoration.none,
                        color: _getTextColor(),
                        fontSize: fontSize ?? SizeConfig.s14,
                        letterSpacing: SizeConfig.s3,
                        fontWeight: (bold == null ? true : bold)
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                ],
              ),
            ),
          );
  }
}
