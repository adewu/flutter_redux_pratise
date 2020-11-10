class Items<T> {
  int typeCount;
  List<int> types;
  List<Item> datas;

  List<Item> get data{
    if(datas == null){
      datas = List();
    }
    return datas;
  }

  Items({this.types, this.datas});

  void setNewData(List<Item> data){
    datas = data;
  }

  void addAllData(List<Item> data){
    if(datas == null){
       datas = List();
    }
    datas.addAll(data);
  }

  void addData(Item data){
    if(datas == null){
       datas = List();
    }
    datas.add(data);
  }

}

abstract class Item {
  int type;

  Item(this.type);

}