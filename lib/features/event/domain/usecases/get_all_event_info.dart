import 'package:eventyle_app/core/usecases/usecase.dart';
import '../entities/event_info_entity.dart';
import '../repositories/event_info_repository.dart';

class GetAllEventInfoUseCase implements UseCase<List<EventInfoEntity>, int> {
  final EventInfoRepository eventInfoRepository;

  GetAllEventInfoUseCase({required this.eventInfoRepository});

  @override
  Future<List<EventInfoEntity>> call(int idEvent) async {
    return await eventInfoRepository.getAllEventInfo(idEvent);
  }
}
