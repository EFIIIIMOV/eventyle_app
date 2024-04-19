import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:flutter/material.dart';

import '../../data/datasources/event_remote_data_source.dart';
import '../../data/repositories/event_repository_impl.dart';
import '../../domain/usecases/add_event.dart';

class CreateEventViewModel extends ChangeNotifier {
  final AddEventUseCase getEventUseCase = AddEventUseCase(
    eventRepository: EventRepositoryImpl(
      eventRemoteDataSource: EventRemoteDataSourceImpl(),
    ),
  );

  CreateEventViewModel();

  Future<void> onSaveNewEventButtonPressed(
    BuildContext context, {
    required String name,
    required String date,
    required String place,
    required String description,
  }) async {
    final EventEntity eventEntity = EventEntity(
        id: 0, name: name, date: date, place: place, description: description);
    getEventUseCase.call(eventEntity);
    //Navigator.pop(context);
  }
}
