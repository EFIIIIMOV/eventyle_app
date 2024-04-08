import 'package:flutter/material.dart';

import '../../../../constants/theme/colors.dart';
import '../../../../constants/theme/fonts.dart';
import '../../../../constants/widgets/container_box_decoration.dart';

class EventCreateTopInfo extends StatelessWidget {
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _placeController = TextEditingController();

  EventCreateTopInfo({super.key});

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
            padding: const EdgeInsets.only(top: 0),
            decoration: const BoxDecoration(),
            child: const Text('Выбрать фотографию',
                style: AppFonts.inkWellButtonTextStyle),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: CustomContainerBoxDecoration.customDecoration,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            // Отступы по 16 по вертикали
            child: Column(
              children: [
                CustomCreateEventTextField(
                  fieldHintText: 'Полное название',
                  textController: _nameController,
                ),
                Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
                CustomCreateEventTextField(
                  fieldHintText: 'Дата проведения',
                  textController: _dateController,
                ),
                Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
                CustomCreateEventTextField(
                  fieldHintText: 'Место проведения',
                  textController: _placeController,
                ),
              ],
            ),
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
