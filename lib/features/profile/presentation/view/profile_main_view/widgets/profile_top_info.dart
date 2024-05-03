import 'package:flutter/material.dart';

import '../../../../../../core/constants/widgets/container_box_decoration.dart';

class ProfileTopInfo extends StatelessWidget {
  final String name;
  final String surname;
  final String role;
  final String description;

  const ProfileTopInfo({
    super.key,
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
            ClipRRect(
              borderRadius: BorderRadius.circular(150.0),
              child: Image.asset(
                'assets/images/test_image.png',
                width: 130,
                height: 130,
              ),
            ),
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
