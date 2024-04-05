import 'package:flutter/material.dart';

import '../../../../../../constants/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Закругленные углы
          border: Border.all(color: AppColors.appBarTextColor), // Цвет границы
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
