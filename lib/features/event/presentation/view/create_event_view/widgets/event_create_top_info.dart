import 'package:flutter/material.dart';

import '../../../../../../core/constants/theme/colors.dart';
import '../../../../../../core/constants/theme/fonts.dart';
import '../../../../../../core/constants/widgets/container_box_decoration.dart';

class EventCreateTopInfo extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController dateController;
  final TextEditingController placeController;
  final TextEditingController infoDescriptionController;

  EventCreateTopInfo(
      {super.key,
      required this.nameController,
      required this.dateController,
      required this.placeController,
      required this.infoDescriptionController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
        const SizedBox(height: 20),
        Container(
          decoration: CustomContainerBoxDecoration.customDecoration,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Column(
              children: [
                CustomCreateEventTextField(
                  fieldHintText: 'Полное название',
                  textController: nameController,
                ),
                Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
                CustomCreateEventTextField(
                  fieldHintText: 'Дата проведения',
                  textController: dateController,
                ),
                Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
                CustomCreateEventTextField(
                  fieldHintText: 'Место проведения',
                  textController: placeController,
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
                  minHeight: 50,
                  maxHeight: 200,
                ),
                child: SingleChildScrollView(
                  child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: infoDescriptionController,
                    decoration: const InputDecoration(
                      hintText: 'Описание',
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
