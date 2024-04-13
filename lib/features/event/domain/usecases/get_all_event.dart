import 'package:eventyle_app/core/usecases/usecase.dart';
import 'package:eventyle_app/features/event/domain/repositories/event_repository.dart';
import '../../data/repositories/event_repository_impl.dart';
import '../entities/event_entity.dart';

class GetAllEventUseCase implements UseCase<List<EventEntity>, void> {
  final EventRepository eventRepository;

  GetAllEventUseCase({required this.eventRepository});

  @override
  Future<List<EventEntity>> call(void params) async {
    final events = await eventRepository.getAllEvents();
    print(events);
    return events;
  }
}
