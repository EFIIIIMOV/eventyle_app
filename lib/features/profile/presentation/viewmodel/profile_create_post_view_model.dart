import 'dart:convert';

import 'package:eventyle_app/features/profile/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:uuid/uuid.dart';

import '../../data/datasources/post_image_remote_data_source.dart';
import '../../data/datasources/post_remote_data_source.dart';
import '../../data/repositories/post_image_repository_impl.dart';
import '../../data/repositories/post_repository_impl.dart';
import '../../domain/entities/post_image_entity.dart';
import '../../domain/usecases/add_post.dart';
import '../../domain/usecases/add_post_image.dart';

class ProfileCreatePostViewModel extends ChangeNotifier {
  final AddPostUseCase addPostUseCase = AddPostUseCase(
    postRepository: PostRepositoryImpl(
      postRemoteDataSource: PostRemoteDataSourceImpl(),
    ),
  );

  final AddPostImageUseCase addPostImageUseCase = AddPostImageUseCase(
    postImageRepository: PostImageRepositoryImpl(
      postImageRemoteDataSource: PostImageRemoteDataSourceImpl(),
    ),
  );

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

    List<String> imageIds = postImageEntities
        .map((postImageEntity) => postImageEntity.image_id)
        .toList();

    final post_id = Uuid().v4().replaceAll('-', '');
    final PostEntity postEntity = PostEntity(
      post_id: post_id,
      postText: postText,
      imageIds: imageIds,
    );

    addPostUseCase.call(postEntity);
    addPostImageUseCase.call(postImageEntities);
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
