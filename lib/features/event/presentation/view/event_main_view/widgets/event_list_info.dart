import 'package:flutter/material.dart';
import '../../../../../../constants/widgets/container_box_decoration.dart';

class EventListInfo extends StatelessWidget {
  final VoidCallback onTap;

  EventListInfo({Key? key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomContainerBoxDecoration.customDecoration,
      child: Column(
        children: generateList(context, onTap),
      ),
    );
  }
}

List<Widget> generateList(BuildContext context, VoidCallback onTap) {
  List<Widget> children = [];
  children.add(
    ListTile(
      onTap: onTap,
      leading: const Icon(
        Icons.add,
        color: Colors.blue,
      ),
      title: const Text(
        'Добавить информацию',
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    ),
  );

  for (int i = 0; i < 9; i++) {
    children.addAll(
      [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            height: 0,
            thickness: 0.5,
            color: Colors.grey,
          ),
        ),
        ListTile(
          title: Text('Информация о мероприятии ${i + 1}'),
        ),
      ],
    );
  }

  return children;
}
