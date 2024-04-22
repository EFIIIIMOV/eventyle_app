import 'package:flutter/material.dart';

import '../../../../../../core/constants/theme/colors.dart';
import '../../../../../../core/constants/theme/fonts.dart';

class EventSelectImage extends StatelessWidget {
  const EventSelectImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'assets/images/test_image.png',
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(height: 15),
      InkWell(
        onTap: () {},
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.commonTextColor,
                width: 1.0,
              ),
            ),
          ),
          child: const Text(
            'Выбрать фотографию',
            style: AppFonts.inkWellButtonTextStyle,
          ),
        ),
      ),
    ]);
  }
}
