part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final List<Employee> employees;

  const HomeLoadedState(this.employees);

  @override
  List<Object> get props => [employees];
}

class HomeErrorState extends HomeState {
  final String? errorMessage;

  const HomeErrorState({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
