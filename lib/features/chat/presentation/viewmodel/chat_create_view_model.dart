import 'dart:convert';

import 'package:eventyle_app/features/chat/domain/usecases/get_all_users.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

import '../../data/datasources/chat_user_remote_data_source.dart';
import '../../data/repositories/chat_user_repository_impl.dart';
import '../../domain/entities/chat_entity.dart';
import '../../domain/entities/chat_image_entity.dart';
import '../../domain/entities/chat_user_entity.dart';

class ChatCreateViewModel extends ChangeNotifier {
  final GetAllUsersUseCase getAllUsersUseCase = GetAllUsersUseCase(
    chatUserRepository: ChatUserRepositoryImpl(
      chatUserRemoteDataSource: ChatUserRemoteDataSourceImpl(),
    ),
  );

  ChatCreateViewModel();

  late String chat_id;
  File? chatSelectedImage = null;
  List<ChatUserEntity> userList = [];
  List<ChatUserEntity> selectedUserList = [];
  String searchQuery = "";

  void updateImageField() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    chatSelectedImage = File(returnedImage!.path);
    notifyListeners();
  }

  Future<void> getChatUsers() async {
    userList = await getAllUsersUseCase.call(searchQuery);
    notifyListeners();
  }

  Future<void> filterResult(String newSearchQuery) async {
    searchQuery = newSearchQuery;
    userList = await getAllUsersUseCase.call(searchQuery);
    notifyListeners();
  }

  bool isUserSelected(String user_id) {
    return selectedUserList.any(
      (selectedUser) => selectedUser.user_id == user_id,
    );
  }

  void toggleUserSelected(int index) {
    isUserSelected(userList[index].user_id)
        ? selectedUserList.remove(userList[index])
        : selectedUserList.add(userList[index]);
    notifyListeners();
  }

  Future<void> onSaveNewEventButtonPressed(
    BuildContext context, {
    required String name,
    required String place,
    required String description,
  }) async {
    chat_id = Uuid().v4().replaceAll('-', '');
    final ChatEntity eventEntity =
        ChatEntity(chat_id: chat_id, name: name, description: description);
    //await addChatUseCase.call(eventEntity);
    if (chatSelectedImage != null) {
      final imageBytes = await chatSelectedImage!.readAsBytes();
      final base64Image = base64Encode(imageBytes);
      final ChatImageEntity eventImageEntity = ChatImageEntity(
        image_id: chat_id,
        image: base64Image,
      );
      //await addChatImageUseCase.call(eventImageEntity);
    }
    if (selectedUserList.isNotEmpty) {
      final List<String> userIds = [];
      selectedUserList.forEach((ChatUserEntity selectUser) {
        userIds.add(selectUser.user_id);
      });
      final response = {"event_id": chat_id, "user_ids": userIds};
      //await addUserToChatUseCase.call(response);
    }
    chatSelectedImage = null;
    userList = [];
    selectedUserList = [];
    Navigator.pop(context);
  }
}
