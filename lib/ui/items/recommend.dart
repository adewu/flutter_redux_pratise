import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/model/list/RecommendMainModel.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/card/item_card.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/image/common_image.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class RecommendGridItem extends AdapterView {
  RecommendGridItem(int type, BuildContext context) : super(type, context);

  Widget createModules(Module model) {
    if (model.moduleType == 1 && model.uiType == 4) {
      return IrregularGrid(model.itemArray);
    } else if (model.moduleType == 2 && model.uiType == 4) {
      //横向List
      return generateHorList(context, model.items);
    } else if (model.moduleType == 2 && model.uiType == 1) {
      //广告
      return ListImgAdCard(model.items[0]);
    } else if (model.moduleType == 1 && model.uiType == 3) {
      //三列
      return MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: generateThreeCols(model.itemArray));
    } else if (model.moduleType == 4 && model.uiType == 1) {
      //动画影视list
      return generateHorAnimationList(context, model.items);
    } else if (model.moduleType == 6 && model.uiType == 1) {
      //小说三列
      return generateNovelThreeCols(model.itemArray);
    } else {
      //两列grid
      return MediaQuery.removePadding(
          context: context, removeTop: true, child: generateTwoCols(model));
    }
  }

  Widget generateTwoCols(Module model) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 5, childAspectRatio: 1.2),
      itemBuilder: (context, index) {
        Item itemModel;
        if (model != null && model.items != null && model.items.isNotEmpty) {
          itemModel = model.items[index];
        } else if (model != null &&
            model.itemArray != null &&
            model.itemArray.isNotEmpty) {
          itemModel = model.itemArray[index][0];
        }
        return CommonLandScapeCard(itemModel, 170, 100);
      },
      itemCount: model.itemCount,
    );
  }

  Widget generateNovelThreeCols(List<List<Item>> list) {
    var gridView = GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 5, childAspectRatio: 0.68),
      itemBuilder: (context, index) {
        Item itemModel = list[index][0];
        return CommonVerticalCard(itemModel, isUseInGridView: true);
      },
      itemCount: list.length,
    );
    return gridView;
  }

  Widget generateThreeCols(List<List<Item>> list) {
    var gridView = GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 5, childAspectRatio: 0.68),
      itemBuilder: (context, index) {
        Item itemModel = list[index][0];
        return CommonVerticalCard(itemModel, isUseInGridView: true);
      },
      itemCount: list.length,
    );
    return gridView;
  }

  //横向list
  Widget generateHorList(BuildContext context, List<Item> list) {
    return Container(
      height: 200,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Container(
                child: Img(
                  list[position].cover ?? "",
                ),
              ),
            );
          }),
    );
  }

  //横向动画影视list
  Widget generateHorAnimationList(BuildContext context, List<Item> list) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 200,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, position) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                ),
                child: Container(
                  child: Img(
                    list[position].cover ?? "",
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  Widget createView(AdapterItem bean) {
    var model = bean as Module;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            height: 50,
            child: Row(
              children: <Widget>[
                Text(
                  model.moduleInfo.title,
                  style: TextStyle(
                      fontSize: 18,
                      color: ColorConfig.black,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
        createModules(model),
      ],
    );
  }

  //不规则网格
  Widget IrregularGrid(List<List<Item>> list) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonLandScapeCard(list[0][0], 250, 140),
            ),
            CommonVerticalCard(list[1][0]),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CommonVerticalCard(list[2][0]),
              CommonVerticalCard(list[3][0]),
              CommonVerticalCard(list[4][0]),
            ],
          ),
        ),
      ],
    );
  }
}
