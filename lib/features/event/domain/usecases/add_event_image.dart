import 'dart:convert';

import 'package:eventyle_app/features/event/domain/entities/event_image_entity.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/event_image_repository.dart';

class AddEventImageUseCase implements UseCase<void, EventImageEntity> {
  final EventImageRepository eventImageRepository;

  AddEventImageUseCase({required this.eventImageRepository});

  @override
  Future<void> call(EventImageEntity eventImageEntity) async {
    return await eventImageRepository.addEventImage(eventImageEntity);
  }
}
