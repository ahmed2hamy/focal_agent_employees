part of 'constants.dart';

const Color kPrimaryColor = Color(0xffFE7C73);
const Color kAccentColor = Color(0xffDBEBFF);

final MaterialColor kPrimarySwatch =
    MaterialColor(kPrimaryColor.hashCode, _primaryColorMap);

Map<int, Color> _primaryColorMap = {
  50: const Color.fromRGBO(254, 124, 115, .1),
  100: const Color.fromRGBO(254, 124, 115, .2),
  200: const Color.fromRGBO(254, 124, 115, .3),
  300: const Color.fromRGBO(254, 124, 115, .4),
  400: const Color.fromRGBO(254, 124, 115, .5),
  500: const Color.fromRGBO(254, 124, 115, .6),
  600: const Color.fromRGBO(254, 124, 115, .7),
  700: const Color.fromRGBO(254, 124, 115, .8),
  800: const Color.fromRGBO(254, 124, 115, .9),
  900: const Color.fromRGBO(254, 124, 115, 1),
};
