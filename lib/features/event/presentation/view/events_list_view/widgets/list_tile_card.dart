import 'package:eventyle_app/core/constants/widgets/create_image_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/datetime_parse_util.dart';

class ListTileCard extends StatelessWidget {
  final String eventId;
  final String eventTitle;
  final DateTime eventDate;

  const ListTileCard({
    super.key,
    required this.eventTitle,
    required this.eventDate,
    required this.eventId,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
          leading: createImageWidget(
              borderRadiusCircular: 8,
              containerSize: 50,
              imageUrl:
                  'http://10.0.2.2:8000/events/image/image_id/${eventId.replaceAll('-', '')}'),
          title: Text(eventTitle),
          subtitle: Text(dateTimeParseUtil(eventDate)),
        ),
      ),
    );
  }
}
