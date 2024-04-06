import 'package:eventyle_app/constants/theme/fonts.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(
            title,
            style: AppFonts.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: AppColors.appBarBackgroundColor,
          elevation: 0,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            height: 1,
            color: AppColors.dividerColor, // Цвет полоски
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}
