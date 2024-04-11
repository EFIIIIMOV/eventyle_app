import 'package:flutter/material.dart';

import 'chat_message_card.dart';

class ChatMessageList extends StatelessWidget {
  ChatMessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            return ChatMessageCard(isMyMessage: true);
          } else {
            return ChatMessageCard(
              isMyMessage: false,
            );
          }
        },
      ),
    );
  }
}
