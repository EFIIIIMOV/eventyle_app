import 'package:eventyle_app/features/profile/presentation/view/profile_create_post_view/widgets/post_image_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/constants/theme/colors.dart';
import '../../../../../../core/constants/theme/fonts.dart';
import '../../../../../../core/constants/theme/container_box_decoration.dart';
import '../../../viewmodel/profile_create_post_view_model.dart';

class ProfilePostCreateInfo extends StatelessWidget {
  final TextEditingController postTextController;
  final List<XFile> selectedImageFileList;
  final Function()? onTap;

  ProfilePostCreateInfo({
    super.key,
    required this.selectedImageFileList,
    required this.onTap,
    required this.postTextController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomContainerBoxDecoration.customDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 0,
                    maxHeight: 200,
                  ),
                  child: SingleChildScrollView(
                    child: TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: postTextController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                        hintText: 'Текст поста',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                );
              },
            ),
            Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
            Consumer<ProfileCreatePostViewModel>(
                builder: (context, viewModel, child) {
              return PostImageList(
                selectedImageFileList: selectedImageFileList,
              );
            }),
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
                  onTap: onTap,
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
