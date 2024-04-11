import 'package:eventyle_app/features/found_users/presentation/view/user_list_view/widgets/user_list_tile_card.dart';
import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: UserListTileCard(),
          );
        },
      ),
    );
  }
}
