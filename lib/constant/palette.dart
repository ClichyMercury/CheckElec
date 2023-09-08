import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor orangeToWhite = MaterialColor(
    0xFFF28D20, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffF08007), //10%
      100: Color(0xffF28D20), //20%
      200: Color(0xffF39938), //30%
      300: Color(0xffF4A651), //40%
      400: Color(0xffF6B36A), //50%
      500: Color(0xffF7BF83), //60%
      600: Color(0xffF9CC9B), //70%
      700: Color(0xffFAD9B4), //80%
      800: Color(0xffFCE5CD), //90%
      900: Color(0xffFDF2E6), //100%
    },
  );
}
