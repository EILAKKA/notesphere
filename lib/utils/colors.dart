import 'package:flutter/material.dart';

class AppColors {
  // primary colors

  static const Color eiBgColor = Color(0xff202326);
  static const Color eiFabColor = Color.fromARGB(255, 204, 17, 237);
  static const Color eiCardColor = Color(0xff2f3235);
  static const Color eiWhite = Colors.white;

  // gradiant colors
  static const int gradiantStart = 0xff01f0ff;
  static const int gradiantEnd = 0xff4441ed;

  LinearGradient eiPrimaryGradiant = LinearGradient(
    colors: [Color(gradiantStart), Color(gradiantEnd)],

    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
