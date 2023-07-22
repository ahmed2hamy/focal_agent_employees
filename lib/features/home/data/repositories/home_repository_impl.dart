import 'package:dartz/dartz.dart';
import 'package:focal_agent_employees/constants/constants.dart';
import 'package:focal_agent_employees/core/models/exception.dart';
import 'package:focal_agent_employees/core/models/failures.dart';
import 'package:focal_agent_employees/core/network/network_info.dart';
import 'package:focal_agent_employees/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:focal_agent_employees/features/home/domain/entities/employee.dart';
import 'package:focal_agent_employees/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  late final NetworkInfo _networkInfo;
  late final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl({
    required NetworkInfo networkInfo,
    required HomeRemoteDataSource homeRemoteDataSource,
  }) {
    _networkInfo = networkInfo;
    _remoteDataSource = homeRemoteDataSource;
  }

  @override
  Future<Either<Failure, List<Employee>>> getEmployees() async {
    if (await _networkInfo.isConnected) {
      return _getEmployeesRemotely();
    } else {
      return const Left(ServerFailure(message: Strings.noConnection));
    }
  }

  Future<Either<Failure, List<Employee>>> _getEmployeesRemotely() async {
    try {
      List<Employee> employees = await _remoteDataSource.getEmployees();

      return Right(employees);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
