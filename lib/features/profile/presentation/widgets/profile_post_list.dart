import 'package:eventyle_app/features/profile/presentation/widgets/profile_post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePostList extends StatelessWidget {
  const ProfilePostList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Посты:',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Transform.translate(
              offset: Offset(12.0, 0.0),
              child: IconButton(
                padding: EdgeInsets.zero,
                // Устанавливаем padding в EdgeInsets.zero
                onPressed: () {},
                icon: const Icon(
                  Icons.add_box,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Column(
          children: generateList(5),
        )
      ],
    );
  }
}

List<Widget> generateList(int count) {
  List<Widget> children = [];

  for (int i = 0; i < count; i++) {
    children.add(
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: ProfilePostCard(),
      ),
    );
  }

  return children;
}
