import 'package:eventyle_app/constants/widgets/container_box_decoration.dart';
import 'package:flutter/material.dart';

class ProfileTopInfo extends StatelessWidget {
  const ProfileTopInfo({super.key});

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
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Имя Фамилия',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Специальность',
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
          height: 150,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'О себе',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(color: Colors.grey.shade300, thickness: 1, height: 10),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'data',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
