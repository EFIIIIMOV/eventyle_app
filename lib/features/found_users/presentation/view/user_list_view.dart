import 'package:flutter/material.dart';

import '../../../../constants/theme/colors.dart';
import '../../../../constants/widgets/app_bar_widget.dart';
import '../../../../constants/widgets/bottom_bar_widget.dart';
import '../widgets/user_list_tile.dart';
import '../widgets/user_search_field.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Пользователи',
        buttonIcon: Icons.star_outline_sharp,
        onButtonPressed: null,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
      ),
      body: Column(
        children: [
          UserSearchField(),
          UserListTile(),
        ],
      ),
    );
  }
}
