import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../../core/constants/theme/colors.dart';
import '../../../../../../core/constants/theme/fonts.dart';
import '../../../../core/constants/theme/container_box_decoration.dart';

class SignUpUserImage extends StatelessWidget {
  final File? selectedImage;
  final void Function()? onTap;

  SignUpUserImage({
    super.key,
    required this.selectedImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Делает контейнер круглым
              border: Border.all(
                color: Colors.black, // Цвет обводки
                width: 2.0, // Толщина обводки
              ),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(150.0),
                child: Image(
                  image: selectedImage == null
                      ? const AssetImage(
                          'assets/images/image_default.png',
                        ) as ImageProvider<Object>
                      : FileImage(selectedImage!),
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                )),
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
        ],
      ),
    );
  }
}
