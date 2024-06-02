import 'dart:convert';

import 'package:eventyle_app/features/profile/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:uuid/uuid.dart';

import '../../domain/entities/post_image_entity.dart';

class ProfileCreatePostViewModel extends ChangeNotifier {
  ProfileCreatePostViewModel();

  List<XFile> selectedImageFileList = [];
  List<PostImageEntity> postImageEntities = [];

  Future<void> onSaveNewEventButtonPressed(
    BuildContext context, {
    required String postText,
  }) async {
    if (selectedImageFileList.isNotEmpty) {
      postImageEntities = await Future.wait(
        selectedImageFileList.map((image) async {
          return PostImageEntity(
            image_id: Uuid().v4().replaceAll('-', ''),
            image: await imageToString(image),
          );
        }).toList(),
      );
    }

    final post_id = Uuid().v4().replaceAll('-', '');
    final PostEntity postEntity = PostEntity(
      post_id: post_id,
      postText: postText,
      images: postImageEntities,
    );

    print(postEntity.post_id);
    print(postEntity.postText);
    if (postEntity.images != null && postEntity.images!.isNotEmpty) {
      print(postEntity.images![0].image_id);
      if (postEntity.images!.length > 9) {
        print(postEntity.images![9].image_id);
      }
    }

    selectedImageFileList = [];
    Navigator.pop(context);
  }

  Future<String> imageToString(XFile image) async {
    final imageBytes = await image.readAsBytes();
    final base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  void selectImages(BuildContext context) async {
    final List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      if (selectedImages.length + selectedImageFileList.length <= 10) {
        selectedImageFileList.addAll(selectedImages);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Максимальное количество изображений: 10'),
          ),
        );
      }
    }
    notifyListeners();
  }
}
