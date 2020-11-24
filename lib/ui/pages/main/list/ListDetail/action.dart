import 'package:fish_redux/fish_redux.dart';

enum ListDetailAction {
  refresh,
  action
}

class ListDetailActionCreator {

  static Action onRefresh() {
    return const Action(ListDetailAction.refresh);
  }

}
