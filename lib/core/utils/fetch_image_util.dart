import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Widget> fetchImage({
  required String imageUrl,
  required double boxSize,
}) async {
  final response = await http.get(Uri.parse(imageUrl));
  if (response.statusCode == 200) {
    try {
      return CachedNetworkImage(
          imageUrl: imageUrl,
          width: boxSize,
          height: boxSize,
          fit: BoxFit.cover);
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
