import 'package:flutter/material.dart';

class CustumTheme {
  static const Color textColor = Color(0xFF3D3D3D);
  static const Color orangeMainColor = Color(0xFFF28D20);
  static const Color bgColor = Color(0xffF3F2F7);
  static const Color lightTeal = Color(0xFF94C2C5);

  static ThemeData getTheme() {
    Map<String, double> fontSize = {
      'very small': 10,
      'small': 15,
      'medium': 20,
      'big medium': 25,
      'big': 30,
      'extra big': 42.5
    };
    return ThemeData(
        primaryColor: orangeMainColor,
        fontFamily: 'Isophan',
        textTheme: TextTheme(
          displayLarge:
              TextStyle(color: Colors.white, fontSize: fontSize['extra big']),
          headlineLarge:
              TextStyle(color: Colors.black, fontSize: fontSize['big']),
          displayMedium:
              TextStyle(color: Colors.black, fontSize: fontSize['big medium']),
          headlineMedium:
              TextStyle(color: Colors.black, fontSize: fontSize['medium']),
          displaySmall:
              TextStyle(color: Colors.black, fontSize: fontSize['small']),
          headlineSmall:
              TextStyle(color: Colors.black, fontSize: fontSize['very small']),
        ));
  }
}
