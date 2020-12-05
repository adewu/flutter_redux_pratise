import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/constant/page_route_name.dart';
import 'package:flutter_redux_pratise/model/list/RecommendMainModel.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/image/common_image.dart';

class CommonVerticalCard extends StatelessWidget {
  Item itemModel;
  bool isUseInGridView;

  CommonVerticalCard(this.itemModel, {this.isUseInGridView});

  _getPadding() {
    if (isUseInGridView == null) {
      isUseInGridView = false;
    }
    if (isUseInGridView) {
      return const EdgeInsets.only(top: 2.0, left: 10.0);
    } else {
      return const EdgeInsets.only(top: 2.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Map<String, dynamic> args = Map();
        args["comicId"] = itemModel.comicId;
        Navigator.pushNamed(context, PageRouteName.COMIC_DETAIL,
            arguments: args);
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                height: 140,
                width: 110,
                child: PhysicalModel(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.antiAlias,
                  child: Img(
                      itemModel.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: _getPadding(),
              child: Container(
                width: 110,
                child: Text(
                  itemModel.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: _getPadding(),
              child: Container(
                width: 110,
                child: Text(
                  itemModel.subTitle ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13, color: ColorConfig.xB2B2B2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonLandScapeCard extends StatelessWidget {
  Item itemModel;
  double imageWidth;
  double imageHeight;

  CommonLandScapeCard(this.itemModel, this.imageWidth, this.imageHeight);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Map<String, dynamic> args = Map();
        args["comicId"] = itemModel.comicId;
        Navigator.pushNamed(context, PageRouteName.COMIC_DETAIL,
            arguments: args);
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                height: imageHeight,
                width: imageWidth,
                child: PhysicalModel(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.antiAlias,
                  child: Img(
                      itemModel.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 2.0),
              child: Text(
                itemModel.title ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 4.0),
              child: Text(
                itemModel.subTitle ?? "",
                style: TextStyle(fontSize: 13, color: ColorConfig.xB2B2B2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListImgAdCard extends StatelessWidget {
  Item itemModel;

  ListImgAdCard(this.itemModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Map<String, dynamic> args = Map();
        args["comicId"] = itemModel.comicId;
        Navigator.pushNamed(context, PageRouteName.COMIC_DETAIL,
            arguments: args);
      },
      child: Container(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PhysicalModel(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              clipBehavior: Clip.antiAlias,
              child: Img(
                  itemModel.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
