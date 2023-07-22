import 'package:dartz/dartz.dart';
import 'package:focal_agent_employees/core/models/failures.dart';
import 'package:focal_agent_employees/features/home/domain/entities/employee.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Employee>>> getEmployees();
}
