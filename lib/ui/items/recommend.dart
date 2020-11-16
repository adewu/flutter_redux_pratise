import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/model/list/RecommendMainModel.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class RecommendGridItem extends AdapterView {
  RecommendGridItem(int type, BuildContext context) : super(type, context);

  Widget creteGridView(ComicMainModel model) {
    var gridView = GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 5, childAspectRatio: 1.2),
      itemBuilder: (context, index) {
        ComicItemModel itemModel = model.comics[index];
        return createRecommendGridItemView(itemModel);
      },
      itemCount: model.comics.length,
    );
    return MediaQuery.removePadding(
        context: context, removeTop: true, child: gridView);
  }

  @override
  Widget createView(Item bean) {
    ComicMainModel model = bean as ComicMainModel;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 50,
          child: Row(
            children: <Widget>[
              Container(
                height: 50,
                child: Image(
                  image: NetworkImage(
                    model.newTitleIconUrl,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              Text(model.itemTitle),
            ],
          ),
        ),
        creteGridView(model),
      ],
    );
  }

  Widget createRecommendGridItemView(ComicItemModel itemModel) {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            width: 170,
            child: Image(
              image: NetworkImage(
                itemModel.cover,
              ),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0,top: 2.0),
            child: Text(
              itemModel.name ?? "",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 4.0),
            child: Text(
              itemModel.subTitle ?? "",
              style: TextStyle(fontSize: 13, color: ColorConfig.xB2B2B2),
            ),
          ),
        ],
      ),
    );
  }
}
