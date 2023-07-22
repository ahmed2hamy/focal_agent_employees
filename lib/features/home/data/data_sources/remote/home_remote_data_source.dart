import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:focal_agent_employees/core/models/exception.dart';
import 'package:focal_agent_employees/features/home/data/models/employees_response_model.dart';
import 'package:focal_agent_employees/features/home/domain/entities/employee.dart';

abstract class HomeRemoteDataSource {
  Future<List<Employee>> getEmployees();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<Employee>> getEmployees() async {
    try {
      await Future.delayed(
          const Duration(seconds: 3)); // Simulate API call delay
      // Replace the following with actual data retrieval logic

      Map<String, dynamic> response = await rootBundle.loadStructuredData(
          'assets/employees.json', (s) async => jsonDecode(s));

      EmployeesResponseModel res = EmployeesResponseModel.fromJson(response);

      List<Employee> employees = res.data?.map((e) {
            if (e.category == "IT") {
              return ITEmployee(
                id: e.id,
                firstName: e.firstName,
                lastName: e.lastName,
              );
            } else if (e.category == "HR") {
              return HREmployee(
                id: e.id,
                firstName: e.firstName,
                lastName: e.lastName,
              );
            } else {
              throw Exception('Unknown employee category: ${e.category}');
            }
          }).toList() ??
          [];

      return employees;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }
}
