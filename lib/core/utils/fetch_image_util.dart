import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;

Future<Widget> fetchImage({
  required String imageUrl,
  required double boxSize,
}) async {
  final response = await http.get(Uri.parse(imageUrl));
  if (response.statusCode == 200) {
    try {
      await ui.instantiateImageCodec(response.bodyBytes);
      return Image(
        image: MemoryImage(response.bodyBytes),
        width: boxSize,
        height: boxSize,
        fit: BoxFit.cover,
      );
    } catch (_) {
      return Image.asset(
        'assets/images/image_default.png',
        width: boxSize,
        height: boxSize,
        fit: BoxFit.cover,
      );
    }
  } else {
    return Image.asset(
      'assets/images/image_default.png',
      width: boxSize,
      height: boxSize,
      fit: BoxFit.cover,
    );
  }
}
