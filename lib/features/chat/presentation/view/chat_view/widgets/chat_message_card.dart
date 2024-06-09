import 'package:flutter/material.dart';

import '../../../../../../core/constants/widgets/create_image_widget.dart';
import '../../../../domain/entities/chat_user_entity.dart';

class ChatMessageCard extends StatelessWidget {
  final bool isMyMessage;
  final String messageText;
  final ChatUserEntity userInfo;

  ChatMessageCard({
    super.key,
    required this.isMyMessage,
    required this.messageText,
    required this.userInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMyMessage)
            CreateImageWidget(
                borderRadiusCircular: 150,
                containerSize: 32,
                imageUrl:
                    '/user/profile/image/?user_id=${userInfo.user_id.replaceAll('-', '')}'),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: isMyMessage
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 2 / 3,
                  ),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: isMyMessage
                        ? Colors.black.withOpacity(0.8)
                        : Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isMyMessage)
                        Text(
                          "${userInfo.name} ${userInfo.surname}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      Text(
                        messageText,
                        style: TextStyle(
                          color: isMyMessage ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
