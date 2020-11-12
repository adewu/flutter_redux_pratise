import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/model/home/banner.dart';
import 'package:flutter_redux_pratise/model/test/testa.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerItemView extends AdapterView {
  BannerItemView(int type) : super(type);

  @override
  createView(Item bean) {
    var b = bean as Banner;
    return Container(
      height: 200,
      child: Column(
        children: <Widget>[
          Container(
            height: 180,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
              child: PhysicalModel(
                color: Colors.transparent, //设置背景底色透明
                borderRadius: BorderRadius.circular(12),
                clipBehavior: Clip.antiAlias, //注意这个属性
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        print(b.list[index].imagePath);
                      },
                      child: Image(
                        image: NetworkImage(
                          b.list[index].imagePath,
                        ),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  itemCount: b.list.length,
                  autoplay: true,
                  duration: 500,
                  pagination: SwiperPagination(),
                  controller: SwiperController(),
                ),
              ),
            ),
          ),
          //divider
          Container(height: 5,color: ColorConfig.commonBGGrey,)
        ],
      ),
    );
  }
}
//Stack(
//                children: <Widget>[
//                  Positioned.fill(
//                    child: Material(
//                      borderRadius: BorderRadius.circular(80.0),
//                      child: Image(
//                        image: NetworkImage(
//                          b.list[index].imagePath,
//                        ),
//                        fit: BoxFit.cover,
//                      ),
//                    ),
//                  ),
//                  Container(
//                      alignment: Alignment.bottomCenter,
//                      child: Text(b.list[index].title)),
//                ],
//              ),
