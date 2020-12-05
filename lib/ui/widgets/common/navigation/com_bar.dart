import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/config/size_config.dart';
import 'package:flutter_redux_pratise/utils/log_util.dart';
import 'package:flutter_redux_pratise/utils/utils.dart';

class CommonBar extends StatelessWidget implements PreferredSizeWidget {

  String title;
  bool isBack2Native;
  VoidCallback callback;


  CommonBar({this.title, this.isBack2Native, this.callback});

  static Future _finishNativePage() async {
    const platform =
    const MethodChannel('me.wuxm.flutter.io/navigate');
    try {
      await platform.invokeMethod('finishNativePage');
    } on PlatformException catch (e) {
      Log.info(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? "",
        style: new TextStyle(
            color: ColorConfig.black,
            fontWeight: FontWeight.normal,
            fontSize: 18.0),
      ),
      centerTitle: true,
      leading: Builder(builder: (BuildContext context) {
        return FlatButton(
          child: Image.asset(
            Utils.getImgPath('back'),
            width: SizeConfig.s30,
            height: SizeConfig.s30,
          ),
          onPressed: callback != null
              ? callback
              : () {
            if (isBack2Native ?? false) {
              FlutterBoost.singleton.closeCurrent();
            } else {
              Navigator.pop(context);
            }
          },
        );
      }),
      elevation: 0.5,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.s50);
}
