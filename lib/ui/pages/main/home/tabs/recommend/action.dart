import 'package:fish_redux/fish_redux.dart';

enum RecommendAction { action }

class RecommendActionCreator {
  static Action onAction() {
    return const Action(RecommendAction.action);
  }
}
