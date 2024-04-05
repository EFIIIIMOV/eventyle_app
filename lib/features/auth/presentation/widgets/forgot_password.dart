import 'package:eventyle_app/constants/theme/colors.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  final VoidCallback onPressed;

  const ForgotPassword({super.key, required this.onPressed});

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
        child: const Text(
          'Забыли пароль?',
          style: TextStyle(
            color: AppColors.commonTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
