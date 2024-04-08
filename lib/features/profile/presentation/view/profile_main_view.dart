import 'package:eventyle_app/features/profile/presentation/widgets/profile_top_info.dart';
import 'package:flutter/material.dart';

import '../../../../constants/theme/colors.dart';
import '../../../../constants/widgets/app_bar_widget.dart';
import '../../../../constants/widgets/bottom_bar_widget.dart';
import '../widgets/profile_post_list.dart';

class ProfileMainView extends StatelessWidget {
  const ProfileMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
          title: 'Профиль', buttonIcon: null, onButtonPressed: null),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 3),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                ProfileTopInfo(),
                SizedBox(height: 20),
                ProfilePostList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
