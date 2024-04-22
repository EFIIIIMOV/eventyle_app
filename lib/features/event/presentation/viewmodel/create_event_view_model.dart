import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

import '../../../../core/constants/theme/themeData.dart';
import '../../data/datasources/event_remote_data_source.dart';
import '../../data/repositories/event_repository_impl.dart';
import '../../domain/usecases/add_event.dart';

class CreateEventViewModel extends ChangeNotifier {
  final AddEventUseCase addEventUseCase = AddEventUseCase(
    eventRepository: EventRepositoryImpl(
      eventRemoteDataSource: EventRemoteDataSourceImpl(),
    ),
  );

  DateTime? eventSelectDate = null;

  CreateEventViewModel();

  Future<void> onSaveNewEventButtonPressed(
    BuildContext context, {
    required String name,
    required String place,
    required String description,
  }) async {
    final EventEntity eventEntity = EventEntity(
        event_id: const Uuid().v4(),
        name: name,
        date: eventSelectDate!,
        place: place,
        description: description);
    addEventUseCase.call(eventEntity);
    eventSelectDate = null;
    Navigator.pop(context);
  }

  void updateDateField(BuildContext context) async {
    eventSelectDate = await showDatePicker(
      context: context,
      initialDate: eventSelectDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: Locale('ru', 'RU'),
      builder: (_, child) {
        return customShowDatePickerTheme(child);
      },
    );
    notifyListeners();
  }
}
