import 'package:eventyle_app/constants/theme/colors.dart';
import 'package:flutter/material.dart';

class SignUpTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String signQuestionTitle;
  final String signTitle;

  const SignUpTextButton(
      {super.key,
      required this.onPressed,
      required this.signTitle,
      required this.signQuestionTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          signQuestionTitle,
          style: TextStyle(
            color: AppColors.commonTextColor,
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: onPressed,
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
              style: TextStyle(
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
