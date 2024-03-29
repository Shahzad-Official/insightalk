import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFFE94057);
  Map<int, Color> color = const {
    50: Color.fromRGBO(233, 64, 87, .1),
    100: Color.fromRGBO(233, 64, 87, .2),
    200: Color.fromRGBO(233, 64, 87, .3),
    300: Color.fromRGBO(233, 64, 87, .4),
    400: Color.fromRGBO(233, 64, 87, .5),
    500: Color.fromRGBO(233, 64, 87, .6),
    600: Color.fromRGBO(233, 64, 87, .7),
    700: Color.fromRGBO(233, 64, 87, .8),
    800: Color.fromRGBO(233, 64, 87, .9),
    900: Color.fromRGBO(233, 64, 87, 1),
  };
  customMaterialColor() {
    return MaterialColor(0xffE94057, color);
  }
}
