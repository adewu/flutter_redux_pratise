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
    print('调用ui更新');
    return const Action(HomeListAction.updateUi);
  }
  static Action selectItem(dynamic obj) {
    print('调用xuanzhong tiaomu ');
    return Action(HomeListAction.selectItem,payload: obj);
  }
}
