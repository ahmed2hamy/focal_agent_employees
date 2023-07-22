import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focal_agent_employees/core/use_case/use_case.dart';
import 'package:focal_agent_employees/features/home/domain/entities/employee.dart';
import 'package:focal_agent_employees/features/home/domain/use_cases/get_employees_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  late final GetEmployeesUseCase _getEmployeesUseCase;

  HomeCubit({
    required GetEmployeesUseCase getEmployeesUseCase,
  })  : _getEmployeesUseCase = getEmployeesUseCase,
        super(HomeInitialState());

  void fetchEmployees() async {
    emit(HomeLoadingState());

    final res = await _getEmployeesUseCase.call(NoParams());

    res.fold(
      (l) => emit(HomeErrorState(errorMessage: l.message)),
      (r) => emit(HomeLoadedState(r)),
    );
  }
}
