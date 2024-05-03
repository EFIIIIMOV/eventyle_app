import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/constants/theme/colors.dart';
import '../../../../../../core/constants/theme/fonts.dart';

class EventSelectImage extends StatelessWidget {
  final File? selectedImage;
  final void Function()? onTap;

  const EventSelectImage({
    super.key,
    required this.selectedImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image(
          image: selectedImage == null
              ? const AssetImage('assets/images/image_default.png')
                  as ImageProvider<Object>
              : FileImage(selectedImage!),
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(height: 15),
      InkWell(
        onTap: onTap,
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
