

import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';

typedef OnIndicatorSelected(int position);

class TopTextIndicator extends StatelessWidget {
  TopTextIndicatorItems items;
  OnIndicatorSelected listener;
  TopTextIndicator(this.items,this.listener);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Center(
          child: Container(
            width: 240,
            child: Row(
              children: _generateTexts(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _generateTexts() {
    var list = List<Widget>();
    var i = 0;
    for (var value in items.texts) {
      list.add(_generateText(value,i));
      i += 1;
    }
    return list;
  }

  Widget _generateText(String value,int position) {
    return GestureDetector(
      onTap: (){
        if(listener != null){
          listener(position);
        }
      },
      child: Container(
        width: 60.0,
        child: Center(
          child: Text(
            value,
            style: TextStyle(fontSize: 20.0,color: position == items.selected ? ColorConfig.xDCF7E8 : ColorConfig.x9AE8C2),
          ),
        ),
      ),
    );
  }
}

class TopTextIndicatorItems{
  List<String> texts;
  int selected = 0;
  TopTextIndicatorItems(this.texts,this.selected);
}