import 'package:eventyle_app/core/usecases/usecase.dart';
import 'package:eventyle_app/features/event/domain/repositories/event_repository.dart';
import '../entities/event_entity.dart';

class AddEventUseCase implements UseCase<void, EventEntity> {
  final EventRepository eventRepository;

  AddEventUseCase({required this.eventRepository});

  @override
  Future<void> call(EventEntity eventEntity) async {
    return await eventRepository.addEvent(eventEntity);
  }
}
