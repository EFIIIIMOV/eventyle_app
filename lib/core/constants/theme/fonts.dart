import 'package:flutter/material.dart';

import 'colors.dart';

class AppFonts {
  static const TextStyle appBarTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.appBarTextColor,
  );

  static const TextStyle signTitleTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
    color: AppColors.appBarTextColor,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.buttonTextColor,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.commonTextColor,
  );

  static const TextStyle signQuestionTextStyle = TextStyle(
    color: AppColors.commonTextColor,
  );

  static const TextStyle inkWellButtonTextStyle = TextStyle(
    color: AppColors.commonTextColor,
    fontWeight: FontWeight.bold,
  );
}
