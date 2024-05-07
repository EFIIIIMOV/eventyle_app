import 'dart:convert';

import 'package:eventyle_app/features/event/data/datasources/event_image_remote_data_source.dart';
import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:eventyle_app/features/event/domain/entities/event_image_entity.dart';
import 'package:eventyle_app/features/event/domain/entities/event_user_entity.dart';
import 'package:eventyle_app/features/event/domain/usecases/add_event_image.dart';
import 'package:eventyle_app/features/event/domain/usecases/add_user_to_event.dart';
import 'package:eventyle_app/features/event/domain/usecases/get_all_users.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import '../../../../core/constants/theme/themeData.dart';
import '../../data/datasources/event_remote_data_source.dart';
import '../../data/datasources/event_user_remote_data_source.dart';
import '../../data/repositories/event_image_repository_impl.dart';
import '../../data/repositories/event_repository_impl.dart';
import '../../data/repositories/event_user_repository_impl.dart';
import '../../domain/usecases/add_event.dart';
import 'package:http/http.dart' as http;

class CreateEventViewModel extends ChangeNotifier {
  final AddEventUseCase addEventUseCase = AddEventUseCase(
    eventRepository: EventRepositoryImpl(
      eventRemoteDataSource: EventRemoteDataSourceImpl(),
    ),
  );

  final AddEventImageUseCase addEventImageUseCase = AddEventImageUseCase(
    eventImageRepository: EventImageRepositoryImpl(
      eventImageRemoteDataSource: EventImageRemoteDataSourceImpl(),
    ),
  );

  final GetAllUsersUseCase getAllUsersUseCase = GetAllUsersUseCase(
    eventUserRepository: EventUserRepositoryImpl(
      eventUserRemoteDataSource: EventUserRemoteDataSourceImpl(),
    ),
  );

  final AddUserToEventUseCase addUserToEventUseCase = AddUserToEventUseCase(
    eventUserRepository: EventUserRepositoryImpl(
      eventUserRemoteDataSource: EventUserRemoteDataSourceImpl(),
    ),
  );

  late String event_id;
  DateTime? eventSelectDate = null;
  File? eventSelectedImage = null;
  List<EventUserEntity> userList = [];
  List<EventUserEntity> selectedUserList = [];
  String searchQuery = "";

  CreateEventViewModel();

  Future<void> onSaveNewEventButtonPressed(
    BuildContext context, {
    required String name,
    required String place,
    required String description,
  }) async {
    event_id = Uuid().v4().replaceAll('-', '');
    final EventEntity eventEntity = EventEntity(
        event_id: event_id,
        name: name,
        date: eventSelectDate!,
        place: place,
        description: description);
    await addEventUseCase.call(eventEntity);
    if (eventSelectedImage != null) {
      final imageBytes = await eventSelectedImage!.readAsBytes();
      final base64Image = base64Encode(imageBytes);
      final EventImageEntity eventImageEntity = EventImageEntity(
        image_id: event_id,
        image: base64Image,
      );
      await addEventImageUseCase.call(eventImageEntity);
    }
    if (selectedUserList.isNotEmpty) {
      final List<String> userIds = [];
      selectedUserList.forEach((EventUserEntity selectUser) {
        userIds.add(selectUser.user_id);
      });
      final response = {"event_id": event_id, "user_ids": userIds};
      await addUserToEventUseCase.call(response);
    }
    eventSelectDate = null;
    eventSelectedImage = null;
    userList = [];
    selectedUserList = [];
    Navigator.pop(context);
  }

  void updateDateField(BuildContext context) async {
    eventSelectDate = await showDatePicker(
      context: context,
      initialDate: eventSelectDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('ru', 'RU'),
      builder: (_, child) {
        return customShowDatePickerTheme(child);
      },
    );
    notifyListeners();
  }

  void updateImageField() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    eventSelectedImage = File(returnedImage!.path);
    notifyListeners();
  }

  Future<void> getAllUsers() async {
    userList = await getAllUsersUseCase.call(searchQuery);
    notifyListeners();
  }

  Future<void> filterResult(String newSearchQuery) async {
    searchQuery = newSearchQuery;
    await getAllUsers();
    notifyListeners();
  }

  void getSelectedUsers(BuildContext context) {
    // selectedUserList =
    //     userList.where((user) => user.isSelected).map((user) => user).toList();
    notifyListeners();
    Navigator.pop(context);
  }

  void toggleUserSelected(int index) {
    userList[index].isSelected = !userList[index].isSelected;
    userList[index].isSelected
        ? selectedUserList.add(userList[index])
        : selectedUserList.remove(userList[index]);
    print(selectedUserList);
    notifyListeners();
  }
}
