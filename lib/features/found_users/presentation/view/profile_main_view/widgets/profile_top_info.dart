import 'package:flutter/material.dart';
import '../../../../../../core/constants/theme/container_box_decoration.dart';
import '../../../../../../core/constants/widgets/create_image_widget.dart';

class ProfileTopInfo extends StatelessWidget {
  final String user_id;
  final String name;
  final String surname;
  final String role;
  final String description;

  const ProfileTopInfo({
    super.key,
    required this.user_id,
    required this.name,
    required this.surname,
    required this.role,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CreateImageWidget(
                borderRadiusCircular: 150,
                containerSize: 130,
                imageUrl:
                    'http://10.0.2.2:8000/user/profile/image/?user_id=${user_id.replaceAll('-', '')}'),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name $surname',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 10),
                  Text(
                    role,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          decoration: CustomContainerBoxDecoration.customDecoration,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'О себе',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Divider(color: Colors.grey.shade300, thickness: 1, height: 10),
                Text(
                  maxLines: 5,
                  description,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//ClipRRect(
//   borderRadius: BorderRadius.circular(150.0),
//   child: FutureBuilder<Widget>(
//     future: fetchImage(
//         imageUrl:
//             'http://10.0.2.2:8000/user/profile/image/?user_id=${user_id.replaceAll('-', '')}',
//         boxSize: 130),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return SizedBox(
//           height: 130,
//           width: 130,
//           child: Transform.scale(
//             scale: 0.5,
//             child: const CircularProgressIndicator(
//               valueColor:
//                   AlwaysStoppedAnimation<Color>(Colors.black26),
//             ),
//           ),
//         );
//       } else if (snapshot.hasData) {
//         return SizedBox(
//             height: 130, width: 130, child: snapshot.data!);
//       } else {
//         return const SizedBox(
//           height: 130,
//           width: 130,
//         );
//       }
//     },
//   ),
// ),
