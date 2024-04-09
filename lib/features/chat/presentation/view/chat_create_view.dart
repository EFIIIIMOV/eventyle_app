import 'package:flutter/material.dart';

import '../../../../constants/theme/colors.dart';
import '../../../../constants/widgets/app_bar_widget.dart';
import '../../../../constants/widgets/bottom_bar_widget.dart';
import '../widgets/chat_create_top_info.dart';
import '../widgets/chat_create_users.dart';

class ChatCreateView extends StatelessWidget {
  const ChatCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Новый чат',
        buttonIcon: Icons.save,
        onButtonPressed: null,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              ChatCreateTopInfo(),
              SizedBox(height: 16),
              ChatCreateUsers(),
            ],
          ),
        ),
      ),
    );
  }
}
