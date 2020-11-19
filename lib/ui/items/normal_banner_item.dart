import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/model/list/RecommendMainModel.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class NormalBannerItemView extends AdapterView {
  NormalBannerItemView(int type,BuildContext context) : super(type,context);

  @override
  createView(AdapterItem bean) {
    var b = bean as GalleryItems;
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
                        print(b.galleryItems[index].cover);
                      },
                      child: Image(
                        image: NetworkImage(
                          b.galleryItems[index].cover ?? "",
                        ),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  itemCount: b.galleryItems.length,
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
