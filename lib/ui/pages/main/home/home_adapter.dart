import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class HomeAdapter extends BaseAdapter{

  HomeAdapter() : super();

  @override
  bool needLoadMore() {
    throw true;
  }

}