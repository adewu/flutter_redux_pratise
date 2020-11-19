import 'package:fish_redux/fish_redux.dart';

enum RecommendAction { updateUI ,refresh,listScroll}

class RecommendActionCreator {
  static Action onUpdateUI() {
    return const Action(RecommendAction.updateUI);
  }

  static Action onListScroll(int pay) {
    return Action(RecommendAction.listScroll,payload: pay);
  }
  static Action onRefresh() {
    return Action(RecommendAction.refresh);
  }

}
