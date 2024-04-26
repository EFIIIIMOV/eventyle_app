import 'package:flutter/material.dart';

import '../../../../../../core/constants/widgets/container_box_decoration.dart';
import '../../../../../../core/utils/datetime_parse_util.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;

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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FutureBuilder<Widget>(
                      future: _fetchImage(
                          'http://10.0.2.2:8000/events/image/image_id/${eventId.replaceAll('-', '')}'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: 100,
                            width: 100,
                            child: Transform.scale(
                              scale: 0.5,
                              // Измените это значение, чтобы изменить размер индикатора
                              child: const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.black26),
                              ),
                            ),
                          );
                        } else if (snapshot.hasData) {
                          return SizedBox(height: 100, child: snapshot.data!);
                        } else {
                          return const SizedBox(
                            height: 100,
                          );
                        }
                      },
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

Future<Widget> _fetchImage(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));
  if (response.statusCode == 200) {
    try {
      await ui.instantiateImageCodec(response.bodyBytes);
      return Image(
        image: MemoryImage(response.bodyBytes),
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    } catch (_) {
      return Image.asset(
        'assets/images/image_default.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    }
  } else {
    return Image.asset(
      'assets/images/image_default.png',
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
  }
}
