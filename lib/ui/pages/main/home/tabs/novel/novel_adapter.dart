import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class NovelAdapter extends BaseAdapter{

  NovelAdapter() : super();

  @override
  bool needLoadMore() {
    return false;
  }

}