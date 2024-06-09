import 'package:eventyle_app/core/constants/widgets/create_image_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/theme/container_box_decoration.dart';
import '../../../../../../core/utils/datetime_parse_util.dart';

class EventTopInfo extends StatelessWidget {
  final String eventId;
  final DateTime eventDate;
  final String eventPlace;
  final String eventDescription;

  const EventTopInfo(
      {super.key,
      required this.eventDate,
      required this.eventPlace,
      required this.eventDescription,
      required this.eventId});

  @override
  Widget build(BuildContext context) {
    print(eventId);
    return Container(
      decoration: CustomContainerBoxDecoration.customDecoration,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  CreateImageWidget(
                      borderRadiusCircular: 8,
                      containerSize: 100,
                      imageUrl:
                          '/events/image/?image_id=${eventId.replaceAll('-', '')}'),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Дата проведения:\n${dateTimeParseUtil(eventDate)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Место проведения:\n$eventPlace',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(eventDescription),
            ),
          ],
        ),
      ),
    );
  }
}
