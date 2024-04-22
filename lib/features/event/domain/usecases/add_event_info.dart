import 'package:eventyle_app/core/usecases/usecase.dart';
import '../entities/event_info_entity.dart';
import '../repositories/event_info_repository.dart';

class AddEventInfoUseCase implements UseCase<void, EventInfoEntity> {
  final EventInfoRepository eventInfoRepository;

  AddEventInfoUseCase({required this.eventInfoRepository});

  @override
  Future<void> call(EventInfoEntity eventInfoEntity) async {
    return await eventInfoRepository.addEventInfo(eventInfoEntity);
  }
}
