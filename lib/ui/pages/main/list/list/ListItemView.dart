import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/model/list/RankingItemModel.dart';

class ListItemView extends StatelessWidget {
  RankingItemModel rankingItemModel;
  Function onPress;

  ListItemView(this.rankingItemModel, this.onPress);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getView();
  }

  Widget getView() {
    return GestureDetector(
      onTap:(){
        print('执行点击事件');
        this.onPress();
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: new Material(
          shadowColor: Colors.grey[200],
          elevation: 4,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
          clipBehavior: Clip.hardEdge,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Positioned(
                child: CachedNetworkImage(
                  imageUrl: rankingItemModel.cover,
                  fit: BoxFit.cover,
                ),
                top: 0,
                left: 0,
                bottom: 30,
                right: 0,
              ),
              Positioned(
                child: Center(
                  child: Text(
                    rankingItemModel.sortName,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                height: 30,
                left: 0,
                bottom: 0,
                right: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
