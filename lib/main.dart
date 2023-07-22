import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focal_agent_employees/constants/constants.dart';
import 'package:focal_agent_employees/features/home/presentation/manager/home_cubit.dart';
import 'package:focal_agent_employees/features/home/presentation/manager/home_scroll_to_top_cubit.dart';
import 'package:focal_agent_employees/features/home/presentation/pages/home_page.dart';
import 'package:focal_agent_employees/injection_container/injection_container.dart'
    as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Brightness? _brightness;

  ThemeData get _lightTheme => kLightThemeData;

  ThemeData get _darkTheme => kDarkThemeData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _brightness = MediaQuery.of(context).platformBrightness;
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    if (mounted) {
      setState(() {
        _brightness = MediaQuery.of(context).platformBrightness;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<HomeScrollToTopCubit>(),
        ),
      ],
      child: MaterialApp(
        title: Strings.appName,
        theme: _brightness == Brightness.dark ? _darkTheme : _lightTheme,
        home: const HomePage(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
