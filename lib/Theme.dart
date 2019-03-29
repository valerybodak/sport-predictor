import 'package:flutter/material.dart';

class Colors {

  const Colors();


  static const Color appBarTitle = const Color(0xFFFFFFFF);
  static const Color appBarIconColor = const Color(0xFFFFFFFF);
  static const Color appBarDetailBackground = const Color(0x00FFFFFF);
  static const Color appBarGradientStart = const Color(0xFF3383FC);
  static const Color appBarGradientEnd = const Color(0xFF00C6FF);

  static const Color black = const Color(0xff000000);
  static const Color blue = const Color(0xFF3383FC);
  static const Color red = const Color(0xFFCF102C);
  static const Color grey_f8 = const Color(0xFFF8F8F8);
  static const Color grey_c7 = const Color(0xFFC7C8D4);

}

class Dimens {
  const Dimens();

  static const planetWidth = 100.0;
  static const planetHeight = 100.0;
}

class TextStyles {

  const TextStyles();

  static const TextStyle leagueName = const TextStyle(
      color: Colors.grey_c7,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: 14.0
  );

  static const TextStyle teamName = const TextStyle(
    color: Colors.black,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 14.0
  );

  static const TextStyle score = const TextStyle(
      color: Colors.blue,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 15.0
  );
}
