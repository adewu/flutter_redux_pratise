import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/config/space_config.dart';
import 'package:flutter_redux_pratise/utils/log_util.dart';

class SimpleChip extends StatelessWidget {
  List<String> texts;

  Widget _getChip(int position, String value) {
    return Container(
      height: 30,
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Text(
        value,
        style: TextStyle(color: ColorConfig.white, fontSize: 15,fontWeight: FontWeight.w900),
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: new Border.all(color: ColorConfig.white, width: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: SpaceConfig.onlyT12,
      height: 25,
      width: 200,
      child: texts == null
          ? Container()
          : ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _getChip(index, texts[index]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  VerticalDivider(
                    width: 16.0,
                    color: Colors.transparent,
                  ),
              itemCount: texts.length),
    );
  }

  SimpleChip(this.texts);
}
