import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:focal_agent_employees/core/network/network_info.dart';
import 'package:focal_agent_employees/injection_container/features/inject_home_feature.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  _initServices();

  injectHomeFeature(sl);

  ///Core:
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl<Connectivity>()),
  );

  sl.registerLazySingleton<Connectivity>(() => Connectivity());
}

Future<void> _initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
}
