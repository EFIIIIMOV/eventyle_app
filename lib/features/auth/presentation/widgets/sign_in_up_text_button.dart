import 'package:eventyle_app/constants/theme/colors.dart';
import 'package:eventyle_app/constants/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/sign_in_view_model.dart';
import '../viewmodel/sign_up_view_model.dart';

class SignUpTextButton extends StatelessWidget {
  final  Function() onTap;
  final String signQuestionTitle;
  final String signTitle;

  const SignUpTextButton(
      {super.key, required this.signTitle, required this.signQuestionTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(signQuestionTitle, style: AppFonts.authforgotTextStyle),
        const SizedBox(width: 10),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.only(bottom: 0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.commonTextColor,
                  width: 1.0,
                ),
              ),
            ),
            child: Text(
              signTitle,
              style: const TextStyle(
                color: AppColors.commonTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

