import '../entities/event_user_entity.dart';

abstract class EventUserRepository {
  Future<List<EventUserEntity>> getAllUsers(String searchQuery);

  Future<void> addUserToEvent(Map<String, Object> usersList);
}
