import 'package:flutter/material.dart';

import '../../../../constants/theme/colors.dart';
import '../../../../constants/widgets/app_bar_widget.dart';
import '../../../../constants/widgets/bottom_bar_widget.dart';
import '../widgets/chat_list_tile.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Чаты',
        buttonIcon: Icons.add,
        onButtonPressed: () {
          Navigator.pushNamed(context, '/chatCreate');
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
      ),
      body: SafeArea(
        child: ChatListTile(),
      ),
    );
  }
}
