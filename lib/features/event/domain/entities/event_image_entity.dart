import 'package:equatable/equatable.dart';

class EventImageEntity extends Equatable {
  final String image_id;
  final String image;

  const EventImageEntity({
    required this.image_id,
    required this.image,
  });

  @override
  List<Object?> get props => [
        image_id,
        image,
      ];
}
