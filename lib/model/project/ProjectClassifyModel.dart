import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_redux_pratise/model/RootModel.dart';
import 'package:flutter_redux_pratise/model/project/ProjectClassifyItemModel.dart';

part 'ProjectClassifyModel.g.dart';

@JsonSerializable()
class ProjectClassifyModel extends RootModel<List<ProjectClassifyItemModel>> {
  ProjectClassifyModel(
      List<ProjectClassifyItemModel> data, int errorCode, String errorMsg)
      : super(data, errorCode, errorMsg);

  factory ProjectClassifyModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectClassifyModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ProjectClassifyModelToJson(this);
  }
}
