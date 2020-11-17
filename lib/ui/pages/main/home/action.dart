import 'package:fish_redux/fish_redux.dart';

enum HomeAction { action , loadMore,refresh,pageChange}

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action onLoadMore(int present) {
    return Action(HomeAction.loadMore,payload: present);
  }

  static Action onPageChange(int present) {
    return Action(HomeAction.pageChange,payload: present);
  }

  static Action onRefresh() {
    return Action(HomeAction.refresh);
  }
}
