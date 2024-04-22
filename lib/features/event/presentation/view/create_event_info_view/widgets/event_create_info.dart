import 'package:flutter/material.dart';

import '../../../../../../core/constants/theme/colors.dart';
import '../../../../../../core/constants/widgets/container_box_decoration.dart';

class CreateEventInfo extends StatelessWidget {
  final TextEditingController infoNameController;
  final TextEditingController infoDescriptionController;

  const CreateEventInfo({
    super.key,
    required this.infoNameController,
    required this.infoDescriptionController,
  });

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
          child: TextField(
            maxLines: null,
            //keyboardType: TextInputType.multiline,
            controller: infoDescriptionController,
            decoration: const InputDecoration(
              hintText: 'Описание',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 20),
        Material(
          borderRadius: BorderRadius.circular(20.0),
          elevation: 4.0,
          color: Colors.transparent,
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
                child: const Text(
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
