import 'package:flutter/material.dart';

import '../../../../core/constants/theme/colors.dart';
import '../../../../core/constants/theme/fonts.dart';

class SignInUpTextButton extends StatelessWidget {
  final Function() onTap;
  final String signQuestionTitle;
  final String signTitle;

  const SignInUpTextButton(
      {super.key,
      required this.signTitle,
      required this.signQuestionTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(signQuestionTitle, style: AppFonts.signQuestionTextStyle),
        const SizedBox(width: 10),
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.commonTextColor,
                  width: 1.0,
                ),
              ),
            ),
            child: Text(signTitle, style: AppFonts.inkWellButtonTextStyle),
          ),
        ),
      ],
    );
  }
}
