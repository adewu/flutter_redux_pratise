import 'package:fish_redux/fish_redux.dart';

enum NovelAction { updateUI ,refresh, }

class NovelActionCreator {
  static Action onUpdateUI() {
    return const Action(NovelAction.updateUI);
  }

  static Action onRefresh() {
    return Action(NovelAction.refresh);
  }
}
