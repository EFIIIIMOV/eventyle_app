import 'package:flutter/material.dart';

import '../../../../../../core/constants/theme/colors.dart';
import '../../../../../../core/constants/theme/fonts.dart';
import '../../../../../../core/constants/theme/container_box_decoration.dart';

class ChatCreateTopInfo extends StatelessWidget {
  final TextEditingController chatNameController;
  final TextEditingController chatDescriptionController;

  const ChatCreateTopInfo({
    super.key,
    required this.chatNameController,
    required this.chatDescriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: CustomContainerBoxDecoration.customDecoration,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                CustomCreateEventTextField(
                  fieldHintText: 'Название чата',
                  textController: chatNameController,
                ),
                Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 0, // Минимальная высота
                        maxHeight: 200, // Максимальная высота
                      ),
                      child: SingleChildScrollView(
                        child: TextField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          controller: chatDescriptionController,
                          decoration: const InputDecoration(
                            hintText: 'Описание',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    );
                  },
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
