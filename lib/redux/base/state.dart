import 'package:fish_redux/fish_redux.dart';

enum ApiState {
  loading,
  success,
  error,
}

class BaseState {
  ApiState currentState = ApiState.loading;

  ApiState getCurrentState() {
    return currentState;
  }

  setCurrentState(ApiState state) {
    currentState = state;
  }
}
