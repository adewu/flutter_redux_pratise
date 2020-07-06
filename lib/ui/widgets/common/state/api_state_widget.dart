import 'package:flutter/material.dart';
import 'package:flutter_redux_pratise/redux/base/state.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/state/view_state_widget.dart';


/// 创建时间：2020-02-19
/// 作者：wuxm
/// 描述：处理接口请求状态的
///

class ApiStateWidget extends StatelessWidget {
  ApiState currentState;
  String errorMsg;
  VoidCallback onPressed;
  Widget contentWidget;

  ApiStateWidget(
      this.currentState, this.errorMsg, this.onPressed, this.contentWidget);

  @override
  Widget build(BuildContext context) {
    if (currentState == ApiState.loading) {
      return ViewStateBusyWidget();
    } else if (currentState == ApiState.success) {
      return contentWidget;
    } else {
      return ViewStateEmptyWidget(
        message: errorMsg,
        onPressed: onPressed,
      );
    }
  }
}
