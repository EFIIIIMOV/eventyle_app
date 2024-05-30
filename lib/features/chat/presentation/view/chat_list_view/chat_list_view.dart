import 'package:eventyle_app/features/chat/presentation/view/chat_list_view/widgets/chat_list_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/chat_list_view_model.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({super.key});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  late final ChatListViewModel viewModel;

  @override
  void didChangeDependencies() {
    viewModel = context.read<ChatListViewModel>();
    viewModel.getListChats();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Чаты',
        buttonIcon: Icons.add,
        onButtonPressed: () => viewModel.onNewChatButtonPressed(context),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
      body: RefreshIndicator(
        color: Colors.black,
        onRefresh: () async {
          await viewModel.getListChats();
        },
        child: Consumer<ChatListViewModel>(
          builder: (context, viewModel, child) {
            return ListView.builder(
              itemCount: viewModel.listChats.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => viewModel.onChatPressed(context, index),
                  child: ChatListTileCard(
                    chat_id: viewModel.listChats[index].chat_id,
                    chatName: viewModel.listChats[index].name,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
