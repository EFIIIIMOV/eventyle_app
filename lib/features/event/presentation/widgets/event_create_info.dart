import 'package:eventyle_app/constants/widgets/container_box_decoration.dart';
import 'package:flutter/material.dart';

import '../../../../constants/theme/colors.dart';
import '../../../../constants/theme/fonts.dart';

class CreateEventInfo extends StatelessWidget {
  final infoNameController = TextEditingController();
  final infoDescriptionController = TextEditingController();

  CreateEventInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: CustomContainerBoxDecoration.customDecoration,
          child: TextField(
            controller: infoNameController,
            decoration: const InputDecoration(
              hintText: 'Название информации',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: CustomContainerBoxDecoration.customDecoration,
          child: SingleChildScrollView(
            child: TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              controller: infoDescriptionController,
              decoration: const InputDecoration(
                hintText: 'Текст информации',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Material(
          borderRadius: BorderRadius.circular(20.0),
          elevation: 4.0,
          color: Colors.transparent,
          // Прозрачный цвет, чтобы не перекрывать эффект Ink
          child: Ink(
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: 200.0,
                height: 40.0,
                alignment: Alignment.center,
                child: Text(
                  'Добавить файл',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
