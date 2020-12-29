import 'package:flutter/cupertino.dart';
import 'package:flutter_redux_pratise/config/color_config.dart';
import 'package:flutter_redux_pratise/utils/utils.dart';

class DetailRankItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  top: 0,
                  child: Image(
                    width: 15,
                    height: 30,
                    fit: BoxFit.contain,
                    image: AssetImage(
                      Utils.getImgPath("icon_rank_item1"),
                    ),
                  ),
                ),
                Positioned(
                  left: 5,
                  top: 10,
                  right: 5,
                  bottom: 10,
                  child: Image(
                    width: 5,
                    height: 20,
                    fit: BoxFit.contain,
                    image: AssetImage(
                      Utils.getImgPath("icon_no_rank"),
                    ),
                  ),
                ),
                Positioned(
                  left: 2,
                  bottom: 0,
                  right: 2,
                  child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      Utils.getImgPath("icon_comment_lv1"),
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            "Test",
            style: TextStyle(fontSize: 15, color: ColorConfig.comTextGrey),
          ),
        ],
      ),
    );
  }
}

class ComicDetailRank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        DetailRankItem(),
        DetailRankItem(),
        DetailRankItem(),
        DetailRankItem(),
      ],
    );
  }
}
