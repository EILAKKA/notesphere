import 'package:flutter/material.dart';
import 'package:notesphere/utils/colors.dart';

class ThemeDataClass {
  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().primaryColor,
    scaffoldBackgroundColor: EiAppColors.eiBgColor,

    colorScheme: const ColorScheme.dark().copyWith(
      primary: EiAppColors.eiWhite,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: EiAppColors.eiBgColor,
      elevation: 0,
      iconTheme: IconThemeData(color: EiAppColors.eiWhite),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: EiAppColors.eiFabColor,
    ),
  );
}
