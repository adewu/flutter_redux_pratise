import 'package:fish_redux/fish_redux.dart';

enum BaseAction { loading,success,error,loadData,retry }

class BaseActionCreator {
  static Action onLoading() {
    return Action(BaseAction.loading);
  }

  static Action onSuccess(dynamic result) {
    return Action(BaseAction.success,payload: result);
  }

  static Action onError(String message) {
    return Action(BaseAction.error,payload: message);
  }

  static Action onLoadData() {
    return Action(BaseAction.loadData);
  }

  static Action onRetry() {
    return Action(BaseAction.retry);
  }
}