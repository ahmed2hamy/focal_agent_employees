import 'package:focal_agent_employees/features/home/domain/entities/employee.dart';

class EmployeeModel extends Employee {
  EmployeeModel({
    String? id,
    String? firstName,
    String? lastName,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
        );

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['category'] = category;
    return map;
  }
}
