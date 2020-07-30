import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(BannerState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    height: 150,
    child: Swiper(
      itemBuilder: (BuildContext context, int index){
        return Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
      },
      itemCount: 4,
      autoplay: true,
      duration: 500,
      pagination: SwiperPagination(),
      controller: SwiperController(),
    ),
  );
}
