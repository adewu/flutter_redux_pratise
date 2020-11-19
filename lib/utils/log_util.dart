import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:logger/logger.dart';

class Log {

  static var logger = Logger(
    printer: PrettyPrinter(),
  );


  static void info(dynamic message) {
    // logger.i(message);
    print(message);
  }


}
