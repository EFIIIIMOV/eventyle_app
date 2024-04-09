import 'package:flutter/material.dart';

class ChatMessageCard extends StatelessWidget {
  final List<String> messages = [
    'test 1test 1test 1test 1test 1test 1test 1test 1test 1test 1test 1test 1test 1test 1test 1test 1test 1test 1test 1test 1',
  ];
  final bool isMyMessage;

  ChatMessageCard({super.key, required this.isMyMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMyMessage) // Добавляем круглую картинку только для входящих сообщений
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.blue, // Цвет фона вашей круглой картинки
              child: Text(
                "ИФ", // Имя и фамилия (первые буквы)
                style: TextStyle(color: Colors.white),
              ),
            ),
          SizedBox(width: 8), // Промежуток между круглой картинкой и текстом
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
                      if (!isMyMessage) // Добавляем имя и фамилию только для входящих сообщений
                        Text(
                          "Имя Фамилия", // Имя и фамилия
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      Text(
                        messages.first,
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