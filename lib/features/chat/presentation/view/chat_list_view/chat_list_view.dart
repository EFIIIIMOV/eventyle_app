import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/theme/colors.dart';
import '../../../../../constants/widgets/app_bar_widget.dart';
import '../../../../../constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/chat_list_view_model.dart';
import 'widgets/chat_list_tile.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ChatListViewModel>();
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Чаты',
        buttonIcon: Icons.add,
        onButtonPressed: () => viewModel.onNewChatButtonPressed(context),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
      body: ChatListTile(
        onTap: () => viewModel.onChatPressed(context),
      ),
    );
  }
}
