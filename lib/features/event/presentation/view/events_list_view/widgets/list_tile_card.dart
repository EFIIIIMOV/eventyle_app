import 'package:flutter/material.dart';

import '../../../../../../core/utils/datetime_parse_util.dart';

class ListTileCard extends StatelessWidget {
  final String eventTitle;
  final DateTime eventDate;

  const ListTileCard(
      {super.key, required this.eventTitle, required this.eventDate});

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
            child: Image.asset(
              'assets/images/test_image.png',
              width: 50,
              height: 50,
            ),
          ),
          title: Text(eventTitle),
          subtitle: Text(dateTimeParseUtil(eventDate)),
        ),
      ),
    );
  }
}
