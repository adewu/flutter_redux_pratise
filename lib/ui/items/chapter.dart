import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/model/comic/comic_detail_static/chapter_list.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/image/common_image.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class ChapterItem extends StatelessWidget {

  Chapter_list bean;


  ChapterItem(this.bean);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConfig.white,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Img(
              bean.cover ?? "",
              width: 150,
              height: 80,
              radius: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left:12.0),
              child: Column(
                children: <Widget>[
                  Text(bean.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  Text(bean.release_time),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
