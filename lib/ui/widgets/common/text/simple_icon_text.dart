import 'package:flutter/cupertino.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/config/space_config.dart';
import 'package:flutter_redux_pratise/utils/image_utils.dart';

class SimpleIconText extends StatelessWidget {
  String icon;
  String text;
  TextStyle textStyle;
  double iconSize;

  SimpleIconText(this.text, {this.icon, this.textStyle, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ImageIcon(
          AssetImage(
            ImageUtils.getImgPath(icon ?? ""),
          ),
          size: iconSize ?? 13,
        ),
        Container(
          margin: SpaceConfig.onlyL6,
          child: Text(
            text ?? "",
            style: textStyle ??
                TextStyle(
                    fontSize: 15,
                    color: ColorConfig.comTextGrey,
                    decoration: TextDecoration.none),
          ),
        ),
      ],
    );
  }
}

class SimpleUpDownText extends StatelessWidget{

  String icon;
  String text;
  TextStyle textStyle;
  double iconSize;

  SimpleUpDownText(this.text, {this.icon, this.textStyle, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Column(
        children: <Widget>[
          ImageIcon(
            AssetImage(
              ImageUtils.getImgPath(icon ?? ""),
            ),
            size: iconSize ?? 13,
          ),
          Container(
            child: Text(
              text ?? "",
              style: textStyle ??
                  TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: ColorConfig.comTextGrey,
                      decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );
  }

}

class SimpleCountIconText extends StatelessWidget {
  String topText;
  String icon;
  String text;
  TextStyle textStyle;
  double iconSize;

  SimpleCountIconText(
      {this.topText, this.icon, this.text, this.textStyle, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          topText ?? "",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: SpaceConfig.onlyT6,
          child: SimpleIconText(
            text,
            icon: icon,
            iconSize: iconSize,
          ),
        )
      ],
    );
  }
}
