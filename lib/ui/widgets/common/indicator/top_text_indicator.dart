import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';

typedef OnIndicatorSelected(int position);

class TopTextIndicator extends StatefulWidget {
  TopTextIndicatorItems items;
  OnIndicatorSelected listener;
  int scrollPixels = 0;
  int curPageIndex;

  TopTextIndicator(this.items, this.listener,
      {this.scrollPixels, this.curPageIndex});

  @override
  _TopTextIndicatorState createState() {
    return _TopTextIndicatorState();
  }
}

class _TopTextIndicatorState extends State<TopTextIndicator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
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

  void switchIndicator(int index) {
    if (index < widget.items.texts.length) {
      setState(() {
        widget.items.selected = index;
      });
    }
  }

  List<Widget> _generateTexts() {
    var list = List<Widget>();
    var i = 0;
    for (var value in widget.items.texts) {
      list.add(_generateText(value, i));
      i += 1;
    }
    return list;
  }

  _getColor(int position) {
    if ((widget.curPageIndex ?? 0) == 0 && (widget.scrollPixels ?? 0) < 255) {
      return ColorConfig.white;
    }else{
      return position == widget.items.selected
          ? ColorConfig.black
          : ColorConfig.xB2B2B2;
    }
  }

  Widget _generateText(String value, int position) {
    return GestureDetector(
      onTap: () {
        if (widget.listener != null) {
          widget.listener(position);
        }
      },
      child: Container(
        width: 60.0,
        child: Center(
          child: Text(
            value,
            style: TextStyle(
                fontSize: position == widget.items.selected ? 21.0 : 17.0,
                fontWeight:  position == widget.items.selected ? FontWeight.bold : FontWeight.normal,
                color: _getColor(position)),
          ),
        ),
      ),
    );
  }
}

class TopTextIndicatorItems {
  List<String> texts;
  int selected = 0;

  TopTextIndicatorItems(this.texts, this.selected);
}
