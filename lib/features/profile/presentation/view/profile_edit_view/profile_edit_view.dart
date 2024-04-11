import 'package:flutter/material.dart';

import '../../../../../constants/theme/colors.dart';
import '../../../../../constants/widgets/app_bar_widget.dart';
import '../../../../../constants/widgets/bottom_bar_widget.dart';
import 'widgets/profile_edit_info.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Профиль',
        buttonIcon: Icons.save,
        onButtonPressed: null,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ProfileEditInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
