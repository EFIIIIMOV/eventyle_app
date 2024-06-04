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
    viewModel.getAllPosts();
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
        body: RefreshIndicator(
          color: Colors.black,
          onRefresh: () async {
            await viewModel.getAllPosts();
          },
          child: ListView(
            padding: EdgeInsets.all(16),
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
                    user_id: viewModel.profileInfoEntity!.user_id,
                    name: viewModel.profileInfoEntity!.name,
                    surname: viewModel.profileInfoEntity!.surname,
                    role: viewModel.profileInfoEntity!.role,
                    description: viewModel.profileInfoEntity!.description,
                  );
                },
              ),
              SizedBox(height: 20),
              Consumer<ProfileMainViewModel>(
                  builder: (context, viewModel, child) {
                    return ProfilePostList(
                      onTap: () => viewModel.onNewPostButtonPressed(context),
                      postEntityList: viewModel.posts,
                    );
                  })
            ],
          ),
        )
    );
  }
}
