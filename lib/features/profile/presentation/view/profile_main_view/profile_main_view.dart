import 'package:eventyle_app/features/profile/presentation/view/profile_main_view/widgets/profile_top_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/profile_main_view_model.dart';
import 'widgets/profile_post_list.dart';

class ProfileMainView extends StatefulWidget {
  const ProfileMainView({super.key});

  @override
  State<ProfileMainView> createState() => _ProfileMainViewState();
}

class _ProfileMainViewState extends State<ProfileMainView> {
  late final ProfileMainViewModel viewModel;

  @override
  void didChangeDependencies() {
    viewModel = context.read<ProfileMainViewModel>();
    viewModel.getProfileInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
                Consumer<ProfileMainViewModel>(
                  builder: (context, viewModel, child) {
                    return viewModel.profileInfoEntity == null
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                        : ProfileTopInfo(
                            name: viewModel.profileInfoEntity!.name,
                            surname: viewModel.profileInfoEntity!.surname,
                            role: viewModel.profileInfoEntity!.role,
                            description:
                                viewModel.profileInfoEntity!.description,
                          );
                  },
                ),
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
