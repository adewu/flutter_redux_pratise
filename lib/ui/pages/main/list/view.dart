import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/config/space_config.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomeListState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100,
          child: Row(
            children: <Widget>[
              Container(
                margin: SpaceConfig.onlyL12,
                height: 80,
                width: 120,
                child: Image.network(
                  "http://via.placeholder.com/350x150",
                  fit: BoxFit.fill,
                ),
              ),
              Text("Test"),
            ],
          ),
        );
      },
      itemCount: 20,
    ),
  );
}
