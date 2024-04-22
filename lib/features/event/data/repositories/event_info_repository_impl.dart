import 'package:eventyle_app/features/event/data/datasources/event_remote_data_source.dart';
import 'package:eventyle_app/features/event/data/models/event_info_model.dart';
import 'package:eventyle_app/features/event/data/models/event_model.dart';
import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:eventyle_app/features/event/domain/repositories/event_info_repository.dart';
import 'package:eventyle_app/features/event/domain/repositories/event_repository.dart';

import '../../domain/entities/event_info_entity.dart';
import '../datasources/event_info_remote_data_source.dart';

class EventInfoRepositoryImpl implements EventInfoRepository {
  final EventInfoRemoteDataSource eventInfoRemoteDataSource;

  EventInfoRepositoryImpl({required this.eventInfoRemoteDataSource});

  @override
  Future<List<EventInfoEntity>> getAllEventInfo(String idEvent) async {
    final eventInfoModels =
        await eventInfoRemoteDataSource.getAllEventInfo(idEvent);
    List<EventInfoEntity> eventInfoEntities = eventInfoModels
        .map((eventInfoModel) => eventInfoModel as EventInfoEntity)
        .toList();
    return eventInfoEntities;
  }

  @override
  Future<void> addEventInfo(EventInfoEntity eventInfoEntity) async {
    final EventInfoModel eventInfoModel = EventInfoModel(
      info_id: eventInfoEntity.info_id,
      event_id: eventInfoEntity.event_id,
      name: eventInfoEntity.name,
      description: eventInfoEntity.description,
    );
    await eventInfoRemoteDataSource.addEventInfo(eventInfoModel);
    return Future.value();
  }
}
