import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/model/test/testa.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class TestAItem extends AdapterView {
  TestAItem(int type) : super(type);

  @override
  Widget createView(Item bean) {
    var b = bean as Normal;
    return Container(
        height: 110,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 19),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height : 38,
                            child: Text(
                              b.text,
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                          SizedBox(
                            height: 26,
                          ),
                          Text(
                            b.from,
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 80,
                    child: Image.network(
                      b.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1.5,
              color: ColorConfig.commonBGGrey,
            )
          ],
        ));
  }
}
