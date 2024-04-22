import 'package:eventyle_app/features/event/domain/entities/event_info_entity.dart';
import 'package:eventyle_app/features/event/domain/usecases/add_event_info.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../data/datasources/event_info_remote_data_source.dart';
import '../../data/repositories/event_info_repository_impl.dart';

class CreateEventInfoViewModel extends ChangeNotifier {
  CreateEventInfoViewModel();

  final AddEventInfoUseCase addEventInfoUseCase = AddEventInfoUseCase(
    eventInfoRepository: EventInfoRepositoryImpl(
      eventInfoRemoteDataSource: EventInfoRemoteDataSourceImpl(),
    ),
  );

  Future<void> onSaveEventInfoButtonPressed({
    required BuildContext context,
    required String event_id,
    required String infoName,
    required String infoDescription,
  }) async {
    print('event_id = ${event_id}');
    final EventInfoEntity eventInfoEntity = EventInfoEntity(
        info_id: Uuid().v4(),
        event_id: event_id,
        name: infoName,
        description: infoDescription);
    addEventInfoUseCase.call(eventInfoEntity);
    Navigator.of(context).pop();
  }
}
