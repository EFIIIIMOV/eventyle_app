import 'package:flutter/material.dart';

import '../../../../../../core/constants/widgets/create_image_widget.dart';

class ChatListTileCard extends StatelessWidget {
  final String chat_id;
  final String chatName;

  const ChatListTileCard({
    super.key,
    required this.chat_id,
    required this.chatName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: ListTile(
          leading: CreateImageWidget(
              borderRadiusCircular: 150,
              containerSize: 55,
              imageUrl:
                  '/chats/image/?image_id=${chat_id.replaceAll('-', '')}'),
          title: Expanded(child: Text('$chatName')),
        ),
      ),
    );
  }
}
