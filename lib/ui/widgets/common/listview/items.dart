class Items<T> {
  int typeCount;
  List<int> types;
  List<AdapterItem> datas;

  List<AdapterItem> get data{
    if(datas == null){
      datas = List();
    }
    return datas;
  }

  Items({this.types, this.datas});

  void setNewData(List<AdapterItem> data){
    datas = data;
  }

  void addAllData(List<AdapterItem> data){
    if(datas == null){
       datas = List();
    }
    datas.addAll(data);
  }

  void addData(AdapterItem data){
    if(datas == null){
       datas = List();
    }
    datas.add(data);
  }

}

abstract class AdapterItem {
  int type;

  AdapterItem(this.type);

}