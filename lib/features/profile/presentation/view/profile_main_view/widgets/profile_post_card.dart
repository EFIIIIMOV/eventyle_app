import 'package:flutter/material.dart';

import '../../../../../../core/constants/theme/container_box_decoration.dart';

class ProfilePostCard extends StatelessWidget {
  const ProfilePostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomContainerBoxDecoration.customDecoration,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Текст поста'),
            Divider(color: Colors.grey.shade300, thickness: 1, height: 10),
            SizedBox(height: 4),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: generateList(context),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: generateList(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> generateList(BuildContext context) {
  List<Widget> children = [];

  for (int i = 0; i < 5; i++) {
    children.addAll(
      [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/test_image.png',
            width: MediaQuery.of(context).size.width / 7,
            height: MediaQuery.of(context).size.width / 7,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  return children;
}
