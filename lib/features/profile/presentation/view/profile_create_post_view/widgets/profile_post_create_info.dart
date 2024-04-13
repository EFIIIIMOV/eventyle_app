import 'package:flutter/material.dart';

import '../../../../../../core/constants/theme/colors.dart';
import '../../../../../../core/constants/theme/fonts.dart';
import '../../../../../../core/constants/widgets/container_box_decoration.dart';

class ProfilePostCreateInfo extends StatelessWidget {
  final infoDescriptionController = TextEditingController();

  ProfilePostCreateInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomContainerBoxDecoration.customDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LayoutBuilder(
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
                        hintText: 'Текст поста',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                );
              },
            ),
            Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
            const SizedBox(height: 15),
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
                    width: 300.0,
                    height: 42.0,
                    alignment: Alignment.center,
                    child: const Text(
                      "Добавить фото",
                      style: AppFonts.buttonTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
