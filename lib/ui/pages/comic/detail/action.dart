import 'package:fish_redux/fish_redux.dart';

enum ComicDetailAction { updateUI }

class ComicDetailActionCreator {
  static Action updateUI() {
    return const Action(ComicDetailAction.updateUI);
  }
}
