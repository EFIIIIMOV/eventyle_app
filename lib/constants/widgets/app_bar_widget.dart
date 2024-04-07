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
          scrolledUnderElevation: 0.0,
          title: Text(
            title,
            style: AppFonts.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: AppColors.appBarBackgroundColor,
          elevation: 0,
        ),
        const Divider(
          height: 1,
          color: AppColors.dividerColor,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}
