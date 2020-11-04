import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';


class ListViewHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        color: ColorConfig.white,
        child: Center(
          child: CircularProgressIndicator(),
        ));
  }
}

class ListViewFooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        color: ColorConfig.white,
        child: Center(
          child: Text("这里已经是我的底线了"),
        ));
  }
}

class ListViewEmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorConfig.white,
        child: Center(
          child: Text("空空如也~"),
        ));
  }
}