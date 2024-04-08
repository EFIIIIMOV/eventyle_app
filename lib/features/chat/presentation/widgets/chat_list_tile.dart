import 'package:flutter/material.dart';

import 'chat_list_tile_card.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/eventHome');
            print('Элемент списка нажат: $index');
          },
          child: ChatListTileCard(),
        );
      },
    );
  }
}
