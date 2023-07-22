import 'package:focal_agent_employees/constants/constants.dart';

enum Category {
  it,
  hr,
}

abstract class Employee {
  String? id;
  String? firstName;
  String? lastName;
  String? category;

  Employee({
    this.id,
    this.firstName,
    this.lastName,
  });
}

class ITEmployee extends Employee {
  ITEmployee({
    String? id,
    String? firstName,
    String? lastName,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
        );

  @override
  String get category => Strings.it;
}

class HREmployee extends Employee {
  HREmployee({
    String? id,
    String? firstName,
    String? lastName,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
        );

  @override
  String get category => Strings.hr;
}
