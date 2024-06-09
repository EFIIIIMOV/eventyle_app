import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/get_platform_localhost.dart';

class CreateImageWidget extends StatelessWidget {
  final double borderRadiusCircular;
  final double containerSize;
  final String imageUrl;
  final String baseUrl = getBaseUrl();

  CreateImageWidget({
    super.key,
    required double this.borderRadiusCircular,
    required double this.containerSize,
    required String this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadiusCircular),
      child: SizedBox(
        height: containerSize,
        width: containerSize,
        child: CachedNetworkImage(
          imageUrl: "$baseUrl$imageUrl",
          width: containerSize,
          height: containerSize,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => Image.asset(
            'assets/images/image_default.png',
            width: containerSize,
            height: containerSize,
            fit: BoxFit.cover,
          ),
          errorListener: (error) {},
        ),
      ),
    );
  }
}
