import 'package:eventyle_app/features/event/data/datasources/event_remote_data_source.dart';
import 'package:eventyle_app/features/event/data/models/event_model.dart';
import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:eventyle_app/features/event/domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource eventRemoteDataSource;

  EventRepositoryImpl({required this.eventRemoteDataSource});

  @override
  Future<List<EventEntity>> getAllEvents() async {
    final eventModels = await eventRemoteDataSource.getAllEvents();
    List<EventEntity> eventEntities =
        eventModels.map((eventModel) => eventModel as EventEntity).toList();
    return eventEntities;
  }
}
