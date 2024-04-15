import '../entities/event_info_entity.dart';

abstract class EventInfoRepository {
  Future<List<EventInfoEntity>> getAllEventInfo(int idEvent);
}
