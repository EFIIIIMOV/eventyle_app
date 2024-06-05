import 'package:eventyle_app/features/profile/presentation/view/profile_main_view/widgets/profile_top_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import '../../../domain/entities/user_info_entity.dart';
import '../../viewmodel/profile_main_view_model.dart';
import 'widgets/profile_post_list.dart';

class UserProfileMainView extends StatefulWidget {
  const UserProfileMainView({super.key});

  @override
  State<UserProfileMainView> createState() => _ProfileMainViewState();
}

class _ProfileMainViewState extends State<UserProfileMainView> {
  Map<String, dynamic>? args;
  UserInfoEntity? userInfoEntity;
  UserProfileMainViewModel? viewModel;

  @override
  void didChangeDependencies() async {
    args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    userInfoEntity = args?['user'] as UserInfoEntity;
    viewModel = context.read<UserProfileMainViewModel>();
    await viewModel!.getAllPosts(userInfoEntity!.user_id);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    viewModel!.posts = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Профиль',
        buttonIcon: null,
        onButtonPressed: () =>
            viewModel!.onEditProfileInfoButtonPressed(context),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
      body: RefreshIndicator(
        color: Colors.black,
        onRefresh: () async {
          await viewModel!.getAllPosts(userInfoEntity!.user_id);
        },
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Consumer<UserProfileMainViewModel>(
              builder: (context, viewModel, child) {
                return userInfoEntity == null
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      )
                    : ProfileTopInfo(
                        user_id: userInfoEntity!.user_id,
                        name: userInfoEntity!.name,
                        surname: userInfoEntity!.surname,
                        role: userInfoEntity!.role,
                        description: userInfoEntity!.description,
                      );
              },
            ),
            SizedBox(height: 20),
            Consumer<UserProfileMainViewModel>(
                builder: (context, viewModel, child) {
              return ProfilePostList(
                onTap: () => viewModel.onNewPostButtonPressed(context),
                postEntityList: viewModel.posts,
              );
            })
          ],
        ),
      ),
    );
  }
}
