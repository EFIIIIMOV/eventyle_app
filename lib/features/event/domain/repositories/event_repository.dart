import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';

abstract class EventRepository {
  Future<List<EventEntity>> getAllEvents();
}
