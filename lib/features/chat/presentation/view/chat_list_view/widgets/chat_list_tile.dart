import 'package:flutter/material.dart';

import 'chat_list_tile_card.dart';

class ChatListTile extends StatelessWidget {
  final VoidCallback onTap;

  const ChatListTile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: onTap,
          child: ChatListTileCard(),
        );
      },
    );
  }
}
