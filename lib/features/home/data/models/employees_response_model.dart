import 'package:focal_agent_employees/features/home/data/models/employee_model.dart';

class EmployeesResponseModel {
  String? status;
  List<EmployeeModel>? data;

  EmployeesResponseModel({
    this.status,
    this.data,
  });

  EmployeesResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(EmployeeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
