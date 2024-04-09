import 'package:flutter/material.dart';

import '../../../../constants/theme/colors.dart';
import '../../../../constants/widgets/app_bar_widget.dart';
import '../widgets/chat_message_bottom_bar.dart';
import '../widgets/chat_message_list.dart';

class ChatMainView extends StatelessWidget {
  final _controller = TextEditingController();

  ChatMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
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
