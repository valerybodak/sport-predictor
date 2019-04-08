import 'package:flutter/material.dart';

class Colors {

  const Colors();

  static const Color white = const Color(0xffffffff);
  static const Color black = const Color(0xff000000);
  static const Color blue = const Color(0xFF3383FC);
  static const Color red = const Color(0xFFCF102C);
  static const Color grey_f8 = const Color(0xFFF8F8F8);
  static const Color grey_c7 = const Color(0xFFC7C8D4);
  static const Color grey_8e = const Color(0xFF8E91A4);
  static const Color purple_fd = const Color(0xFFFD4B93);
  static const Color purple_e6 = const Color(0xFFE65BB5);
  static const Color purple_f2 = const Color(0xFFF2709c);
  static const Color purple_f8 = const Color(0xFFF85196);
  static const Color violet_6c = const Color(0xff6C50F3);

  static const Color orange_94 = const Color(0xffff9472);
  static const Color yellow_34 = const Color(0xFFffd34c);
  static const Color lime = const Color(0xFF74FF65);

}

class Dimens {
  const Dimens();

  static const planetWidth = 100.0;
  static const planetHeight = 100.0;
}

class TextStyles {

  const TextStyles();

  static const TextStyle onboardingPageTitle = const TextStyle(
      fontSize: 26.0,
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700
  );

  static const TextStyle onboardingPageDescription = const TextStyle(
      fontSize: 14.0,
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400
  );

  static const TextStyle onboardingButtonOK = const TextStyle(
      fontSize: 15.0,
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700
  );

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
      color: Colors.purple_fd,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 16.0
  );

  static const TextStyle listDate = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 14.0
  );

  static const TextStyle matchTime = const TextStyle(
      color: Colors.grey_8e,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: 14.0
  );
}

class Decorations{

  //https://uigradients.com
  static const BoxDecoration purpleGradient = const BoxDecoration(
    // Box decoration takes a gradient
    gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Colors.violet_6c,
        Colors.purple_e6,
      ],
    ),
  );

  static const BoxDecoration nelsonGradient = const BoxDecoration(
    // Box decoration takes a gradient
    gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        const Color(0xFFF2709c),
        const Color(0xffff9472),
      ],
    ),
  );

  static const BoxDecoration reefGradient = const BoxDecoration(
    // Box decoration takes a gradient
    gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        const Color(0xFF3a7bd5),
        const Color(0xFF00d2ff),
      ],
    ),
  );
}
