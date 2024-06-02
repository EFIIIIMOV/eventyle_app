import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/profile_create_post_view_model.dart';
import 'widgets/profile_post_create_info.dart';

class ProfileCreatePostView extends StatefulWidget {
  const ProfileCreatePostView({super.key});

  @override
  State<ProfileCreatePostView> createState() => _ProfileCreatePostViewState();
}

class _ProfileCreatePostViewState extends State<ProfileCreatePostView> {
  late final TextEditingController postTextController;
  late final ProfileCreatePostViewModel viewModel;

  @override
  void initState() {
    super.initState();
    postTextController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    viewModel = context.read<ProfileCreatePostViewModel>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Новый пост',
        buttonIcon: Icons.save,
        onButtonPressed: () => viewModel.onSaveNewEventButtonPressed(context,
            postText: postTextController.text),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ProfilePostCreateInfo(
            selectedImageFileList: viewModel.selectedImageFileList,
            onTap: () => viewModel.selectImages(context),
            postTextController: postTextController,
          ),
        ),
      ),
    );
  }
}
