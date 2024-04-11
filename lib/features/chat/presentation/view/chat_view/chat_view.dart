import 'package:eventyle_app/features/chat/presentation/view/chat_view/widgets/chat_message_list.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/theme/colors.dart';
import '../../../../../constants/widgets/app_bar_widget.dart';
import 'widgets/chat_message_bottom_bar.dart';


class ChatMainView extends StatelessWidget {
  final _controller = TextEditingController();

  ChatMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Новый чат',
        buttonIcon: Icons.edit,
        onButtonPressed: null,
      ),
      body: Column(
          children: [
            ChatMessageList(),
            ChatMessageBottomBar(),
          ],
        ),
    );
  }
}
