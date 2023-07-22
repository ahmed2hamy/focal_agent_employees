part of 'constants.dart';

final ThemeData kLightThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: kPrimarySwatch,
    primary: kPrimaryColor,
    brightness: Brightness.light,
  ),
);

final ThemeData kDarkThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: kPrimarySwatch,
    primary: kPrimaryColor,
    brightness: Brightness.dark,
  ),
);
