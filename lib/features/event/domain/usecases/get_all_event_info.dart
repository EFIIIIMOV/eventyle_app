import 'package:eventyle_app/core/usecases/usecase.dart';
import '../entities/event_info_entity.dart';
import '../repositories/event_info_repository.dart';

class GetAllEventInfoUseCase implements UseCase<List<EventInfoEntity>, String> {
  final EventInfoRepository eventInfoRepository;

  GetAllEventInfoUseCase({required this.eventInfoRepository});

  @override
  Future<List<EventInfoEntity>> call(String idEvent) async {
    var a =  await eventInfoRepository.getAllEventInfo(idEvent);
    return a;
  }
}
