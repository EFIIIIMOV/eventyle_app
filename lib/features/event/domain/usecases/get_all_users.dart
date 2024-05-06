import 'package:eventyle_app/core/usecases/usecase.dart';
import 'package:eventyle_app/features/event/domain/entities/event_user_entity.dart';

import '../repositories/event_user_repository.dart';

class GetAllUsersUseCase implements UseCase<List<EventUserEntity>, String> {
  final EventUserRepository eventUserRepository;

  GetAllUsersUseCase({required this.eventUserRepository});

  @override
  Future<List<EventUserEntity>> call(String searchQuery) async {
    return await eventUserRepository.getAllUsers(searchQuery);
  }
}
