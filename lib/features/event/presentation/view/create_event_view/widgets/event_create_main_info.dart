import 'package:flutter/material.dart';

import '../../../../../../core/constants/theme/colors.dart';
import '../../../../../../core/constants/theme/fonts.dart';
import '../../../../../../core/constants/theme/container_box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'event_select_date.dart';

class EventCreateMainInfo extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController placeController;
  final TextEditingController infoDescriptionController;

  EventCreateMainInfo(
      {super.key,
      required this.nameController,
      required this.placeController,
      required this.infoDescriptionController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
                  fieldHintText: 'Место проведения',
                  textController: placeController,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
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
