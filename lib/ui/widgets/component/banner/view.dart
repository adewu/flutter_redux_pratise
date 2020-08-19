import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    BannerState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    height: 150,
    child: Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.network(
                state.list[index].imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                alignment: Alignment.bottomCenter,
                child: Text(state.list[index].title)),
          ],
        );
      },
      itemCount: state.list.length,
      autoplay: true,
      duration: 500,
      pagination: SwiperPagination(),
      controller: SwiperController(),
    ),
  );
}
