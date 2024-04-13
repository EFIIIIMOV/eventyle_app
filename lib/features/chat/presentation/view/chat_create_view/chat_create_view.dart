import 'package:flutter/material.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import 'widgets/chat_create_top_info.dart';
import 'widgets/chat_create_users.dart';

class ChatCreateView extends StatelessWidget {
  const ChatCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Новый чат',
        buttonIcon: Icons.save,
        onButtonPressed: null,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ChatCreateTopInfo(),
              const SizedBox(height: 16),
              ChatCreateUsers(),
            ],
          ),
        ),
      ),
    );
  }
}
