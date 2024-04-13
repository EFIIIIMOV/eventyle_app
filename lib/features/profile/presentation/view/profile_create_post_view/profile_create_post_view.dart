import 'package:flutter/material.dart';


import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import 'widgets/profile_post_create_info.dart';

class ProfileCreatePostView extends StatelessWidget {
  const ProfileCreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Пост',
        buttonIcon: Icons.save,
        onButtonPressed: null,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ProfilePostCreateInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
