import 'package:flutter/material.dart';

class ChatListTileCard extends StatelessWidget {
  const ChatListTileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(150.0),
          child: Image.asset(
            'assets/images/test_image.png',
            width: 50,
            height: 50,
          ),
        ),
        title: const Text('Название чата'),
        subtitle: const Text('Последнее сообщение в чате'),
      ),
    );
  }
}
