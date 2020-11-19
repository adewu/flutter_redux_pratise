import 'package:fish_redux/fish_redux.dart';

enum RecommendAction { updateUI ,refresh}

class RecommendActionCreator {
  static Action onUpdateUI() {
    return const Action(RecommendAction.updateUI);
  }
  static Action onRefresh() {
    return Action(RecommendAction.refresh);
  }

}
