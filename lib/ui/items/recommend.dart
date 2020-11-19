import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/model/list/RecommendMainModel.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class RecommendGridItem extends AdapterView {
  RecommendGridItem(int type, BuildContext context) : super(type, context);

  Widget creteGridView(Module model) {
    var gridView = GridView.builder(
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
        return createRecommendGridItemView(itemModel, 170, 100);
      },
      itemCount: model.itemCount,
    );
    if (model.moduleType == 1 && model.uiType == 4) {
      return uiType4(model.itemArray);
    } else if (model.moduleType == 2 && model.uiType == 4) {
      //横向List
      return generateHorList(context, model.items);
    }else if(model.moduleType == 2 && model.uiType == 1){
      //广告
      return generateAD(model.items);
    }else if(model.moduleType == 1 && model.uiType == 3){
      //三列
      return MediaQuery.removePadding(
          context: context, removeTop: true, child: generateThreeCols(model.itemArray));
    }else if(model.moduleType == 4 && model.uiType == 1) {
      //动画影视list
      return generateHorAnimationList(context, model.items);
    }else {
      return MediaQuery.removePadding(
          context: context, removeTop: true, child: gridView);
    }
  }

  Widget generateThreeCols(List<List<Item>> list) {
    var gridView = GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 5, childAspectRatio: 0.68),
      itemBuilder: (context, index) {
        Item itemModel = list[index][0];
        return generateCard(itemModel,isUseInGridView: true);
      },
      itemCount: list.length,
    );
    return gridView;
  }

  Widget generateAD(List<Item> list) {
    return Container(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PhysicalModel(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAlias,
            child: Image(
              image: NetworkImage(
                list[0].cover,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
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
              padding: const EdgeInsets.only(left : 10.0,),
              child: Container(
                child: Image(
                  image: NetworkImage(
                    list[position].cover ?? "",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }

  //横向动画影视list
  Widget generateHorAnimationList(BuildContext context, List<Item> list) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: Container(
        height: 200,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, position) {
              return Padding(
                padding: const EdgeInsets.only(left : 10.0,),
                child: Container(
                  child: Image(
                    image: NetworkImage(
                      list[position].cover ?? "",
                    ),
                    fit: BoxFit.scaleDown,
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
                Container(
                  height: 50,
                  child: Image(
                    image: NetworkImage(
                      model.moduleInfo.bgCover,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
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
        creteGridView(model),
      ],
    );
  }

  Widget createRecommendGridItemView(Item itemModel, double imageWidth,
      double imageHeight) {
    return Container(
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
                child: Image(
                  image: NetworkImage(
                    itemModel.cover,
                  ),
                  fit: BoxFit.cover,
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
    );
  }

  Widget uiType4(List<List<Item>> list) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: createRecommendGridItemView(list[0][0], 250, 140),
            ),
            generateCard(list[1][0]),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              generateCard(list[2][0]),
              generateCard(list[3][0]),
              generateCard(list[4][0]),
            ],
          ),
        ),
      ],
    );
  }

  //竖
  Widget generateCard(Item itemModel,{bool isUseInGridView}) {

    _getPadding(){
      if(isUseInGridView == null){
        isUseInGridView = false;
      }
      if(isUseInGridView){
       return const EdgeInsets.only(top: 2.0,left: 10.0);
      }else{
        return const EdgeInsets.only(top: 2.0);
      }
    }

    return Container(
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
                child: Image(
                  image: NetworkImage(
                    itemModel.cover,
                  ),
                  fit: BoxFit.cover,
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
    );
  }
}
