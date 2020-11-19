import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/model/list/RecommendMainModel.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/image/common_image.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerItemView extends AdapterView {
  BannerItemView(int type,BuildContext context) : super(type,context);

  @override
  createView(AdapterItem bean) {
    var b = bean as GalleryItems;
    return Container(
      height: 390,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              print(b.galleryItems[index].cover);
            },
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Img(
                      b.galleryItems[index].cover ?? "",
                  ),
                ),
                Positioned.fill(
                  child: Image(
                    image: NetworkImage(
                      b.galleryItems[index].topCover ?? "",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: b.galleryItems.length,
        autoplay: true,
        duration: 800,
        pagination: SwiperPagination(alignment: Alignment.bottomLeft),
        controller: SwiperController(),
      ),
    );
  }
}
