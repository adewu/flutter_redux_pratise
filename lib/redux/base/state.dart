import 'package:fish_redux/fish_redux.dart';

enum ApiState{
  loading,
  success,
  error,
  idle,
  empty,
}



class BaseState  {

  ApiState currentState = ApiState.idle;


  ApiState getCurrentState(){
    return currentState;
  }

  setCurrentState(ApiState state){
    currentState = state;
  }

}