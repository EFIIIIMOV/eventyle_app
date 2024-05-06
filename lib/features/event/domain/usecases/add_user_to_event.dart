import 'package:eventyle_app/features/event/domain/entities/event_user_entity.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/event_user_repository.dart';

class AddUserToEventUseCase implements UseCase<void, Map<String, Object>> {
  final EventUserRepository eventUserRepository;

  AddUserToEventUseCase({required this.eventUserRepository});

  @override
  Future<void> call(Map<String, Object> usersList) async {
    return await eventUserRepository.addUserToEvent(usersList);
  }
}
