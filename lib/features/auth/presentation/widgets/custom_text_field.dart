import 'package:flutter/material.dart';

import '../../../../core/constants/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.viewBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColors.appBarTextColor),
        ),
        child: TextField(
          obscureText: isObscure,
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
