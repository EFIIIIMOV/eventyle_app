import 'package:flutter/material.dart';

import '../../../../../../core/constants/widgets/container_box_decoration.dart';
import '../../../../../../core/utils/datetime_parse_util.dart';

class EventTopInfo extends StatelessWidget {
  final DateTime eventDate;
  final String eventPlace;
  final String eventDescription;

  const EventTopInfo(
      {super.key,
      required this.eventDate,
      required this.eventPlace,
      required this.eventDescription});

  @override
  Widget build(BuildContext context) {
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/test_image.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Дата проведения:\n${dateTimeParseUtil(eventDate)}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Место проведения:\n$eventPlace',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
