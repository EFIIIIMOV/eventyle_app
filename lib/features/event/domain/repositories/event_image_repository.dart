import 'package:eventyle_app/features/event/domain/entities/event_image_entity.dart';

abstract class EventImageRepository {
  Future<void> addEventImage(EventImageEntity eventEntity);
}
