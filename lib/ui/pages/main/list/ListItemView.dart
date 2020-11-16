import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/model/list/RankingItemModel.dart';

class ListItemView extends StatelessWidget {
  RankingItemModel rankingItemModel;

  ListItemView(this.rankingItemModel);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getView();
  }

  Widget getView() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Container(
        child: Column(
          children: [
            Container(
              child: PhysicalModel(
                color: Colors.transparent, //设置背景底色透明
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
                clipBehavior: Clip.antiAlias, //注意这个属性
                child: Image(image: NetworkImage(this.rankingItemModel.cover,), fit: BoxFit.cover,
                ),
              ),
            ),

            Text(rankingItemModel.sortName,style: TextStyle(textBaseline: TextBaseline.alphabetic),),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: new Border.all(color: Colors.grey.shade300, width: 1),
        ),
      ),
    );
  }
}
