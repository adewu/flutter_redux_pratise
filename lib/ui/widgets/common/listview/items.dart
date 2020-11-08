class Items<T> {
  int typeCount;
  List<int> types;
  List<Item<T>> datas;

  Items({this.types, this.datas});

  void setNewData(List<Item<T>> data){
    datas = data;
  }

  void addData(List<Item<T>> data){
    if(datas == null){
       datas = List();
    }
    datas.addAll(data);
  }

}

class Item<T> {
  int type;
  T bean;

  Item({this.type, this.bean});

}