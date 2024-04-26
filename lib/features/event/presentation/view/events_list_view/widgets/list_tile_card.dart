import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/datetime_parse_util.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;

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
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: FutureBuilder<Widget>(
              future: _fetchImage(
                  'http://10.0.2.2:8000/events/image/image_id/${eventId.replaceAll('-', '')}'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: Colors.black26,
                    ),
                  );
                } else if (snapshot.hasData) {
                  return SizedBox(height: 50, child: snapshot.data!);
                } else {
                  return const SizedBox(
                    height: 50,
                  );
                }
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

Future<Widget> _fetchImage(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));
  if (response.statusCode == 200) {
    try {
      await ui.instantiateImageCodec(response.bodyBytes);
      return Image(
        image: MemoryImage(response.bodyBytes),
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      );
    } catch (_) {
      return Image.asset(
        'assets/images/image_default.png',
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      );
    }
  } else {
    return Image.asset(
      'assets/images/image_default.png',
      width: 50,
      height: 50,
      fit: BoxFit.cover,
    );
  }
}
