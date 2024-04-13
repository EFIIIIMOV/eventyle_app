import 'package:flutter/material.dart';

import '../../../../core/constants/theme/colors.dart';
import '../../../../core/constants/theme/fonts.dart';

class ForgotPassword extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;

  const ForgotPassword(
      {super.key, required this.onPressed, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(top: 0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.commonTextColor,
              width: 1.0,
            ),
          ),
        ),
        child: Text(
          buttonTitle,
          style: AppFonts.inkWellButtonTextStyle,
        ),
      ),
    );
  }
}
