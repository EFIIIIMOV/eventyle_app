import 'package:flutter/material.dart';

import '../../../../../../constants/theme/colors.dart';
import '../../../../../../constants/widgets/container_box_decoration.dart';

class EventTopInfo extends StatelessWidget {
  String eventDate = 'Дата проведения мероприятия';
  String eventPlace = 'Место проведения мероприятия';
  String eventDescription =
      'Описание мероприятия Описание мероприятия Описание мероприятия Описание мероприятия Описание мероприятия Описание мероприятия Описание мероприятия Описание мероприятия Описание мероприятия Описание мероприятия ';

  EventTopInfo({super.key});

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
                          eventDate,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          eventPlace,
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
