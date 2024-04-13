import 'package:eventyle_app/features/profile/presentation/view/profile_main_view/widgets/profile_top_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/profile_main_view_model.dart';
import 'widgets/profile_post_list.dart';

class ProfileMainView extends StatelessWidget {
  const ProfileMainView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ProfileMainViewModel>();
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Профиль',
        buttonIcon: Icons.edit,
        onButtonPressed: () =>
            viewModel.onEditProfileInfoButtonPressed(context),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 3),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                ProfileTopInfo(),
                SizedBox(height: 20),
                ProfilePostList(
                  onTap: () => viewModel.onNewPostButtonPressed(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
