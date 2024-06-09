import 'package:eventyle_app/features/chat/presentation/view/chat_view/widgets/chat_message_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../domain/entities/chat_entity.dart';
import '../../viewmodel/chat_view_model.dart';
import 'widgets/chat_message_bottom_bar.dart';

class ChatMainView extends StatefulWidget {
  ChatMainView({super.key});

  @override
  State<ChatMainView> createState() => _ChatMainViewState();
}

class _ChatMainViewState extends State<ChatMainView> {
  late final TextEditingController _messageController;
  late final Map<String, dynamic>? args;
  late final ChatEntity chatEntity;
  late final ChatViewModel viewModel;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    viewModel.channel!.sink.close();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    chatEntity = args?['chat'] as ChatEntity;
    viewModel = context.read<ChatViewModel>();
    viewModel.getListMessage(chat_id: chatEntity.chat_id);
    viewModel.getListUser(chat_id: chatEntity.chat_id);
    viewModel.getUserId();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: chatEntity.name,
        buttonIcon: Icons.edit,
        onButtonPressed: null,
      ),
      body: Column(
        children: [
          Consumer<ChatViewModel>(builder: (context, viewModel, child) {
            return ChatMessageList(
              messageList: viewModel.messageList,
              userId: viewModel.userId,
              userList: viewModel.userList,
            );
          }),
          ChatMessageBottomBar(
            messageController: _messageController,
            onSendButtonPressed: () => viewModel.sendMessage(
              chat_id: chatEntity.chat_id,
              messageText: _messageController.text,
            ),
          ),
        ],
      ),
    );
  }
}
