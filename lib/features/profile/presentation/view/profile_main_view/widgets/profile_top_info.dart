import 'package:eventyle_app/constants/widgets/container_box_decoration.dart';
import 'package:flutter/material.dart';

class ProfileTopInfo extends StatelessWidget {
  final String nameSurname = 'Имя Фамилия';
  final String speciality = 'Специальность';
  final String description = 'data';

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
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameSurname,
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 10),
                  Text(
                    speciality,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'О себе',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Divider(color: Colors.grey.shade300, thickness: 1, height: 10),
                Text(
                  description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
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
