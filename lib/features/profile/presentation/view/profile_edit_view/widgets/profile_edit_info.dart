import 'package:flutter/material.dart';

import '../../../../../../core/constants/theme/colors.dart';
import '../../../../../../core/constants/theme/fonts.dart';
import '../../../../../../core/constants/theme/container_box_decoration.dart';

class ProfileEditInfo extends StatelessWidget {
  final infoNameController = TextEditingController();
  final infoSurnameController = TextEditingController();
  final infoDescriptionController = TextEditingController();

  ProfileEditInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(150.0),
          child: Image.asset(
            'assets/images/test_image.png',
            width: 130,
            height: 130,
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
        const SizedBox(height: 20),
        Container(
          decoration: CustomContainerBoxDecoration.customDecoration,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                CustomCreateEventTextField(
                  fieldHintText: 'Имя',
                  textController: infoNameController,
                ),
                Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
                CustomCreateEventTextField(
                  fieldHintText: 'Фамилия',
                  textController: infoSurnameController,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 15),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: CustomContainerBoxDecoration.customDecoration,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 50, // Минимальная высота
                  maxHeight: 200, // Максимальная высота
                ),
                child: SingleChildScrollView(
                  child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: infoDescriptionController,
                    decoration: const InputDecoration(
                      hintText: 'О себе',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CustomCreateEventTextField extends StatelessWidget {
  final String fieldHintText;
  final TextEditingController textController;

  const CustomCreateEventTextField(
      {super.key, required this.fieldHintText, required this.textController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        hintText: fieldHintText,
        border: InputBorder.none,
      ),
    );
  }
}
