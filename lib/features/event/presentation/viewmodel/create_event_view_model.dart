import 'dart:convert';

import 'package:eventyle_app/features/event/data/datasources/event_image_remote_data_source.dart';
import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:eventyle_app/features/event/domain/entities/event_image_entity.dart';
import 'package:eventyle_app/features/event/domain/entities/event_user_entity.dart';
import 'package:eventyle_app/features/event/domain/usecases/add_event_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import '../../../../core/constants/theme/themeData.dart';
import '../../data/datasources/event_remote_data_source.dart';
import '../../data/repositories/event_image_repository_impl.dart';
import '../../data/repositories/event_repository_impl.dart';
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

  late String event_id;
  DateTime? eventSelectDate = null;
  File? eventSelectedImage = null;
  List<EventUserEntity> userList = [];
  List<EventUserEntity> selectedUserList = [];

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
    addEventUseCase.call(eventEntity);
    if (eventSelectedImage != null) {
      final imageBytes = await eventSelectedImage!.readAsBytes();
      final base64Image = base64Encode(imageBytes);
      final EventImageEntity eventImageEntity = EventImageEntity(
        image_id: event_id,
        image: base64Image,
      );
      addEventImageUseCase.call(eventImageEntity);
    }
    eventSelectDate = null;
    eventSelectedImage = null;
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

  Future<void> getUsers() async {
    userList = await List.generate(
      10,
      (index) => EventUserEntity(
        user_id: '${index + 1}',
        role: 'roleUser ${index + 1}',
        name: 'nameUser ${index + 1}',
        surname: 'surnameUser ${index + 1}',
        description: 'descriptionUser ${index + 1}',
        isSelected: false,
      ),
    );
    notifyListeners();
  }

  void getSelectedUsers(BuildContext context) {
    selectedUserList =
        userList.where((user) => user.isSelected).map((user) => user).toList();
    notifyListeners();
    Navigator.pop(context);
  }

  void toggleUserSelected(int index) {
    userList[index].isSelected = !userList[index].isSelected;
    notifyListeners();
  }
}
