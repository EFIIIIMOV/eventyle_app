import 'package:eventyle_app/features/event/data/models/event_image_model.dart';
import 'package:eventyle_app/features/event/domain/entities/event_image_entity.dart';
import 'package:eventyle_app/features/event/domain/repositories/event_image_repository.dart';

import '../datasources/event_image_remote_data_source.dart';

class EventImageRepositoryImpl implements EventImageRepository {
  final EventImageRemoteDataSource eventImageRemoteDataSource;

  EventImageRepositoryImpl({required this.eventImageRemoteDataSource});

  @override
  Future<void> addEventImage(EventImageEntity eventImageEntity) async {
    final EventImageModel eventImageModel = EventImageModel(
      image_id: eventImageEntity.image_id,
      image: eventImageEntity.image,
    );
    await eventImageRemoteDataSource.addImageEvent(eventImageModel);
    return Future.value();
  }
}
