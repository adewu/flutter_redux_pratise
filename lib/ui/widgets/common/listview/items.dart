class Items {
  int typeCount;
  List<int> types;
  List<String> datas;

  Items({this.types, this.datas});

  void setNewData(List<String> data){
    datas = data;
  }

  void addData(List<String> data){
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