import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/config/SpaceConfig.dart';
import 'package:flutter_redux_pratise/utils/StringUtil.dart';
import 'package:oktoast/oktoast.dart';

class ToastUtil {
  static void showShortToast(String message) {

    if(StringUtil.isNullOrEmpty(message)){
      //如果message 为空 直接返回
      return;
    }

    showToastWidget(
      ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          padding: SpaceConfig.all12,
          color: Colors.black.withOpacity(0.5),
          child: Text(
            message,
          ),
        ),
      ),
      duration: Duration(seconds: 3),
      position: ToastPosition.center,
    );
  }
}
