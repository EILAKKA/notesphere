import 'package:flutter/widgets.dart';
import 'package:notesphere/utils/colors.dart';

class AppTextStyles {
  // title Style
  static const TextStyle appTitle = TextStyle(
    fontSize: 28,
    color: AppColors.eiWhite,
    fontWeight: FontWeight.bold,
  );

  // subtitle Style
  static const TextStyle subTitle = TextStyle(
    fontSize: 24,
    color: AppColors.eiWhite,
    fontWeight: FontWeight.w500,
  );

  // description text Style large
  static const TextStyle descriptionTitleLarge = TextStyle(
    fontSize: 20,
    color: AppColors.eiWhite,
    fontWeight: FontWeight.w400,
  );
  // description text Style small
  static const TextStyle descriptionTitleSmall = TextStyle(
    fontSize: 14,
    color: AppColors.eiWhite,
    fontWeight: FontWeight.w400,
  );

  // app body  text Style
  static const TextStyle appBody = TextStyle(
    fontSize: 16,
    color: AppColors.eiWhite,
  );

  // app button text Style
  static const TextStyle appButton = TextStyle(
    fontSize: 16,
    color: AppColors.eiWhite,
  );
}
