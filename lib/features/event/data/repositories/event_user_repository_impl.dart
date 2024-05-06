import 'package:eventyle_app/features/found_users/domain/entities/user_info_entity.dart';
import 'package:eventyle_app/features/found_users/domain/repositories/user_info_repository.dart';

import '../../domain/entities/event_user_entity.dart';
import '../../domain/repositories/event_user_repository.dart';
import '../datasources/event_user_remote_data_source.dart';

class EventUserRepositoryImpl implements EventUserRepository {
  final EventUserRemoteDataSource eventUserRemoteDataSource;

  EventUserRepositoryImpl({required this.eventUserRemoteDataSource});

  @override
  Future<List<EventUserEntity>> getAllUsers(String searchQuery) async {
    final eventUserModels =
        await eventUserRemoteDataSource.getAllUsers(searchQuery);
    List<EventUserEntity> userInfoEntities = eventUserModels
        .map((userInfoModels) => userInfoModels as EventUserEntity)
        .toList();
    return userInfoEntities;
  }

  @override
  Future<void> addUserToEvent(Map<String, Object> usersList) async {
    await eventUserRemoteDataSource.addUserToEvent(usersList);
  }
}
