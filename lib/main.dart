import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/app.dart';
import 'package:flutter_redux_pratise/utils/log_util.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
//    Log.uploadFlutterErrorLog(details.exception.toString(),details.stack.toString());
//    Log.upLoadNativeLog(details.exception.toString());
  Log.info(details.exception.toString());
  Log.info(details.stack.toString());
  };

  runZoned(() {
   // debugPaintLayerBordersEnabled = true;
    runApp(App());
  }, zoneSpecification: ZoneSpecification(
    print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
      parent.print(self, line);
    },
  ), onError: (Object e, StackTrace stack) {
    Log.info(e.toString());
    Log.info(stack.toString());
//        Log.uploadFlutterErrorLog(e.toString(),stack.toString());
//        Log.upLoadNativeLog(e.toString());
  });
}
