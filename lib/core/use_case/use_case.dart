import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:focal_agent_employees/core/models/failures.dart';

abstract class UseCase<Type, Params> {
  const UseCase();

  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
