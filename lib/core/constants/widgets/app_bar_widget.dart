import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? buttonIcon;
  final VoidCallback? onButtonPressed;

  const CustomAppBar(
      {super.key,
      required this.title,
      required this.buttonIcon,
      required this.onButtonPressed});

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
            actions: IconData != null
                ? [
                    IconButton(
                        icon: Icon(buttonIcon, color: Colors.black),
                        onPressed: onButtonPressed)
                  ]
                : []),
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
