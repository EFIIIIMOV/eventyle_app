import 'package:flutter/material.dart';

import '../../../../domain/entities/chat_message_entity.dart';
import '../../../../domain/entities/chat_user_entity.dart';
import 'chat_message_card.dart';

class ChatMessageList extends StatelessWidget {
  final List<ChatMessageEntity> messageList;
  final List<ChatUserEntity> userList;
  final String userId;

  const ChatMessageList({
    super.key,
    required this.messageList,
    required this.userId,
    required this.userList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          return ChatMessageCard(
            isMyMessage: messageList[index].user_id == userId,
            messageText: messageList[index].messageText,
            userInfo: userList.firstWhere(
                (user) => user.user_id == messageList[index].user_id),
          );
        },
      ),
    );
  }
}
