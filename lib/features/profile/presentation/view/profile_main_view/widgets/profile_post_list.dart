import 'package:eventyle_app/features/profile/presentation/view/profile_main_view/widgets/profile_post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePostList extends StatelessWidget {
  final VoidCallback onTap;

  const ProfilePostList({Key? key, required this.onTap});

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
                onPressed: () {
                  Navigator.pushNamed(context, '/profilePostCreate');
                },
                icon: const Icon(
                  Icons.add_box,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
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
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: ProfilePostCard(),
      ),
    );
  }

  return children;
}
