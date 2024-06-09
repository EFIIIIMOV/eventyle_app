import 'package:eventyle_app/features/chat/presentation/view/chat_create_view/widgets/chat_select_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/chat_create_view_model.dart';
import 'widgets/chat_create_top_info.dart';
import 'widgets/chat_create_users.dart';

class ChatCreateView extends StatefulWidget {
  const ChatCreateView({super.key});

  @override
  State<ChatCreateView> createState() => _ChatCreateViewState();
}

class _ChatCreateViewState extends State<ChatCreateView> {
  late final TextEditingController _chatNameController;
  late final TextEditingController _chatDescriptionController;
  late final TextEditingController _searchQuery;
  late final ChatCreateViewModel viewModel;

  @override
  void initState() {
    super.initState();
    _chatNameController = TextEditingController();
    _chatDescriptionController = TextEditingController();
    _searchQuery = TextEditingController();
  }

  @override
  void dispose() {
    _chatNameController.dispose();
    _chatDescriptionController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    viewModel = context.read<ChatCreateViewModel>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Новый чат',
        buttonIcon: Icons.save,
        onButtonPressed: () => viewModel.onSaveNewChatButtonPressed(
          context,
          name: _chatNameController.text,
          description: _chatDescriptionController.text,
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Consumer<ChatCreateViewModel>(
                  builder: (context, viewModel, child) {
                return ChatSelectImage(
                  selectedImage: viewModel.chatSelectedImage,
                  onTap: viewModel.updateImageField,
                );
              }),
              SizedBox(height: 20),
              ChatCreateTopInfo(
                chatNameController: _chatNameController,
                chatDescriptionController: _chatDescriptionController,
              ),
              const SizedBox(height: 16),
              ChatCreateUsers(
                selectedUserList: viewModel.selectedUserList,
                searchQuery: _searchQuery,
                onTapSearchButton: () =>
                    viewModel.filterResult(_searchQuery.text),
                getChatUsers: () => viewModel.getChatUsers(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
