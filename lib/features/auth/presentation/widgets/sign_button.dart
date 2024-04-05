import 'package:eventyle_app/constants/theme/fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/theme/colors.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const SignInButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      elevation: 4.0,
      color: Colors.transparent, // Прозрачный цвет, чтобы не перекрывать эффект Ink
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: 300.0,
            height: 42.0,
            alignment: Alignment.center,
            child: Text(
              text,
              style: AppFonts.buttonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
