import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeListAction {
  refresh,
  updateUi,
  selectItem,
}

class HomeListActionCreator {

  static Action onRefresh() {
    return const Action(HomeListAction.refresh);
  }

  static Action onUpdateUi() {
    print('HomeListActionCreator 调用ui更新');
    return const Action(HomeListAction.updateUi);
  }

  static Action selectItem(dynamic obj) {
    print('HomeListActionCreator 调用选中条目');
    return Action(HomeListAction.selectItem,payload: obj);
  }
}
