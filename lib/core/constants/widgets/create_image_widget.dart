import 'package:flutter/material.dart';

import '../../utils/fetch_image_util.dart';

Widget createImageWidget({
  required double borderRadiusCircular,
  required double containerSize,
  required String imageUrl,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(borderRadiusCircular),
    child: FutureBuilder<Widget>(
      future: fetchImage(imageUrl: imageUrl, boxSize: containerSize),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: containerSize,
            width: containerSize,
            child: Transform.scale(
              scale: 0.5,
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black26),
              ),
            ),
          );
        } else if (snapshot.hasData) {
          return SizedBox(
              height: containerSize,
              width: containerSize,
              child: snapshot.data!);
        } else {
          return SizedBox(
            height: containerSize,
            width: containerSize,
          );
        }
      },
    ),
  );
}
