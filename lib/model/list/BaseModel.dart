class BaseModel {
  var code;
  BaseDataModel data;

  BaseModel({this.code, this.data});

  factory BaseModel.fromMap(Map<String, dynamic> map) {
    return BaseModel(
      code: map['code'],
      data: BaseDataModel.fromMap(map['data']),
    );
  }
}

class BaseDataModel {
  dynamic returnData;
  int stateCode;
  String message;

  BaseDataModel({this.stateCode, this.message, this.returnData});

  factory BaseDataModel.fromMap(Map<String, dynamic> map) {
    return new BaseDataModel(
      stateCode: map['stateCode'],
      message: map['message'],
      returnData: map['returnData'],
    );
  }
}
