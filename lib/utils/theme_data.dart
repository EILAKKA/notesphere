import 'package:flutter/material.dart';
import 'package:notesphere/utils/colors.dart';

class ThemeDataClass {
  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().primaryColor,
    scaffoldBackgroundColor: AppColors.eiBgColor,

    colorScheme: const ColorScheme.dark().copyWith(primary: AppColors.eiWhite),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.eiBgColor,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.eiWhite),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.eiFabColor,
    ),
  );
}
