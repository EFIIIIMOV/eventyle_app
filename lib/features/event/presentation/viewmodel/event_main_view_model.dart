import 'package:flutter/material.dart';

import '../../data/datasources/event_info_remote_data_source.dart';
import '../../data/repositories/event_info_repository_impl.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/entities/event_info_entity.dart';
import '../../domain/usecases/get_all_event_info.dart';

class EventMainViewModel extends ChangeNotifier {
  EventMainViewModel();

  final GetAllEventInfoUseCase getAllEventInfoUseCase = GetAllEventInfoUseCase(
    eventInfoRepository: EventInfoRepositoryImpl(
      eventInfoRemoteDataSource: EventInfoRemoteDataSourceImpl(),
    ),
  );

  List<EventInfoEntity> listEventInfo = [];

  Future<void> getListEventInfo(String idEvent) async {
    listEventInfo = await getAllEventInfoUseCase.call(idEvent);
    print(listEventInfo[0]);
    notifyListeners();
  }

  Future<void> onNewInfoButtonPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/eventInfoCreate');
  }

  Future<void> onInfoPressed(
      BuildContext context, int index, String eventName) async {
    Navigator.pushNamed(
      context,
      '/eventInfo',
      arguments: {
        'eventInfo': listEventInfo[index],
        'eventName': eventName,
      },
    );
  }

  Future<void> onEditEventButtonPressed(BuildContext context) async {
    Navigator.of(context).pop();
  }
}
