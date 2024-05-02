import 'package:flutter/material.dart';

import '../../../../core/constants/theme/colors.dart';

class AboutUserTextField extends StatelessWidget {
  final TextEditingController aboutController;

  AboutUserTextField({super.key, required this.aboutController});

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
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 80,
                maxHeight: 200,
              ),
              child: SingleChildScrollView(
                child: TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  controller: aboutController,
                  decoration: const InputDecoration(
                    hintText: 'О себе',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
