import 'package:flutter_redux_pratise/ui/widgets/common/listview/base_adapter.dart';
import 'package:flutter_redux_pratise/ui/widgets/common/listview/items.dart';

class RecommendAdapter extends BaseAdapter{

  RecommendAdapter() : super();

  @override
  bool needLoadMore() {
    return false;
  }

}