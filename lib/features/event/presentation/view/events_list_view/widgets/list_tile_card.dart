import 'package:flutter/material.dart';

import '../../../../../../core/utils/datetime_parse_util.dart';

class ListTileCard extends StatelessWidget {
  final String eventId;
  final String eventTitle;
  final DateTime eventDate;

  const ListTileCard(
      {super.key,
      required this.eventTitle,
      required this.eventDate,
      required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'http://10.0.2.2:8000/events/image/image_id/${eventId.replaceAll('-', '')}',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/image_default.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          title: Text(eventTitle),
          subtitle: Text(dateTimeParseUtil(eventDate)),
        ),
      ),
    );
  }
}
