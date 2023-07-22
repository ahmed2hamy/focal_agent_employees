import 'package:focal_agent_employees/core/network/network_info.dart';
import 'package:focal_agent_employees/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:focal_agent_employees/features/home/data/repositories/home_repository_impl.dart';
import 'package:focal_agent_employees/features/home/domain/repositories/home_repository.dart';
import 'package:focal_agent_employees/features/home/domain/use_cases/get_employees_use_case.dart';
import 'package:focal_agent_employees/features/home/presentation/manager/home_cubit.dart';
import 'package:focal_agent_employees/features/home/presentation/manager/home_scroll_to_top_cubit.dart';
import 'package:get_it/get_it.dart';

void injectHomeFeature(GetIt sl) {
  ///State Management

  sl.registerLazySingleton<HomeScrollToTopCubit>(
    () => HomeScrollToTopCubit(),
  );

  sl.registerLazySingleton<HomeCubit>(
    () => HomeCubit(
      getEmployeesUseCase: sl<GetEmployeesUseCase>(),
    ),
  );

  ///UseCases:
  sl.registerFactory<GetEmployeesUseCase>(
    () => GetEmployeesUseCase(
      homeRepository: sl<HomeRepository>(),
    ),
  );

  ///Repositories:
  sl.registerFactory<HomeRepository>(
    () => HomeRepositoryImpl(
      networkInfo: sl<NetworkInfo>(),
      homeRemoteDataSource: sl<HomeRemoteDataSource>(),
    ),
  );

  ///DataSource - Remote:
  sl.registerFactory<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
}
