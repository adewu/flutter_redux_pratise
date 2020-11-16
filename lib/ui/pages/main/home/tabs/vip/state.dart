import 'package:fish_redux/fish_redux.dart';

class VIPState implements Cloneable<VIPState> {

  @override
  VIPState clone() {
    return VIPState();
  }
}

VIPState initState(Map<String, dynamic> args) {
  return VIPState();
}
