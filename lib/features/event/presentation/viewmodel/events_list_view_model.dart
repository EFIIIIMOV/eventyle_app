import 'package:flutter/material.dart';

import '../../data/datasources/event_remote_data_source.dart';
import '../../data/repositories/event_repository_impl.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/usecases/get_all_event.dart';


class EventsListViewModel extends ChangeNotifier {
  final GetAllEventUseCase getAllEventUseCase = GetAllEventUseCase(
    eventRepository: EventRepositoryImpl(
      eventRemoteDataSource: EventRemoteDataSourceImpl(),
    ),
  );

  List<EventEntity> listEvents = [];

  Future<void> getListEvents() async {
    listEvents = await getAllEventUseCase.call(null);
    notifyListeners();
  }

  Future<void> onNewEventButtonPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/eventCreate');
  }

  Future<void> onEventPressed(BuildContext context, int index) async {
    Navigator.pushNamed(context, '/eventMain',
        arguments: {'event': listEvents[index]});
  }
}
