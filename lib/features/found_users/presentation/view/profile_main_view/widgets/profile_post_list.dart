import 'package:eventyle_app/features/found_users/domain/entities/user_post_entity.dart';
import 'package:eventyle_app/features/found_users/presentation/view/profile_main_view/widgets/profile_post_card.dart';
import 'package:eventyle_app/features/found_users/presentation/viewmodel/profile_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePostList extends StatelessWidget {
  final VoidCallback onTap;
  final List<PostEntity> postEntityList;

  const ProfilePostList({
    Key? key,
    required this.onTap,
    required this.postEntityList,
  });

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
          ],
        ),
        Consumer<UserProfileMainViewModel>(builder: (context, viewModel, child) {
          return Column(
            children: generateList(postEntityList),
          );
        })
      ],
    );
  }
}

List<Widget> generateList(List<PostEntity> postEntityList) {
  List<Widget> children = [];
  for (int i = 0; i < postEntityList.length; i++) {
    children.add(
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: ProfilePostCard(
          postEntity: postEntityList[i],
        ),
      ),
    );
  }
  return children;
}
