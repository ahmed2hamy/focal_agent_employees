import 'package:dartz/dartz.dart';
import 'package:focal_agent_employees/core/models/failures.dart';
import 'package:focal_agent_employees/core/use_case/use_case.dart';
import 'package:focal_agent_employees/features/home/domain/entities/employee.dart';
import 'package:focal_agent_employees/features/home/domain/repositories/home_repository.dart';

class GetEmployeesUseCase implements UseCase<List<Employee>, NoParams> {
  late final HomeRepository _homeRepository;

  GetEmployeesUseCase({required HomeRepository homeRepository}) {
    _homeRepository = homeRepository;
  }

  @override
  Future<Either<Failure, List<Employee>>> call(NoParams params) {
    return _homeRepository.getEmployees();
  }
}
