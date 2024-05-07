import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/fetch_image_util.dart';

class CreateImageWidget extends StatefulWidget {
  final double borderRadiusCircular;
  final double containerSize;
  final String imageUrl;

  const CreateImageWidget({
    super.key,
    required double this.borderRadiusCircular,
    required double this.containerSize,
    required String this.imageUrl,
  });

  @override
  State<CreateImageWidget> createState() => _CreateImageWidgetState();
}

class _CreateImageWidgetState extends State<CreateImageWidget> {
  Widget? image;

  @override
  void didChangeDependencies() async {
    image = await fetchImage(
        imageUrl: widget.imageUrl, boxSize: widget.containerSize);
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('createImageWidgetClass');
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadiusCircular),
      child: SizedBox(
          height: widget.containerSize,
          width: widget.containerSize,
          child: image),
    );

    //   CachedNetworkImage(
    //       imageUrl: imageUrl,
    //       width: containerSize,
    //       height: containerSize,
    //       errorWidget: (context, url, error) => Icon(Icons.error),
    //       //errorListener: ()=>,
    //       fit: BoxFit.cover),
    // );
    //   child: FutureBuilder<Widget>(
    //     future: fetchImage(imageUrl: imageUrl, boxSize: containerSize),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return SizedBox(
    //           height: containerSize,
    //           width: containerSize,
    //           child: Transform.scale(
    //             scale: 0.5,
    //             child: const CircularProgressIndicator(
    //               valueColor: AlwaysStoppedAnimation<Color>(Colors.black26),
    //             ),
    //           ),
    //         );
    //       } else if (snapshot.hasData) {
    //         return SizedBox(
    //             height: containerSize,
    //             width: containerSize,
    //             child: snapshot.data!);
    //       } else {
    //         return SizedBox(
    //           height: containerSize,
    //           width: containerSize,
    //         );
    //       }
    //     },
    //   ),
    // );
  }
}

//
// Widget createImageWidget({
//   required double borderRadiusCircular,
//   required double containerSize,
//   required String imageUrl,
// }) {
//   print('createImageWidget');
//   return ClipRRect(
//     borderRadius: BorderRadius.circular(borderRadiusCircular),
//     child: FutureBuilder<Widget>(
//       future: fetchImage(imageUrl: imageUrl, boxSize: containerSize),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return SizedBox(
//             height: containerSize,
//             width: containerSize,
//             child: Transform.scale(
//               scale: 0.5,
//               child: const CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.black26),
//               ),
//             ),
//           );
//         } else if (snapshot.hasData) {
//           return SizedBox(
//               height: containerSize,
//               width: containerSize,
//               child: snapshot.data!);
//         } else {
//           return SizedBox(
//             height: containerSize,
//             width: containerSize,
//           );
//         }
//       },
//     ),
//   );
// }
