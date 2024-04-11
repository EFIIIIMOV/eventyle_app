import 'package:flutter/material.dart';

import '../../../../../../constants/widgets/container_box_decoration.dart';

class ChatCreateUsers extends StatelessWidget {
  const ChatCreateUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomContainerBoxDecoration.customDecoration,
      child: Column(
        children: generateList(),
      ),
    );
  }
}

List<Widget> generateList() {
  List<Widget> children = [];

  children.add(
    ListTile(
      onTap: () {},
      leading: Icon(
        Icons.add,
        color: Colors.blue,
      ),
      title: Text(
        'Добавить пользователя',
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    ),
  );

  for (int i = 0; i < 3; i++) {
    children.addAll(
      [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.shade300,
          ),
        ),
        ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text('Информация о мероприятии ${i + 1}'), // Текст
        ),
      ],
    );
  }

  return children;
}
