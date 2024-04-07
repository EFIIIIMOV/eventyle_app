import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constants/theme/fonts.dart';
import 'list_tile_card.dart';

class EventListInfo extends StatelessWidget {
  const EventListInfo({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 0.1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: generateList(),
        ),
      ),
    );
  }
}

List<Widget> generateList() {
  List<Widget> children = [];
  children.add(
    ListTile(
      title: InkWell(
          onTap: () {},
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: Colors.blue,
              ),
              Text(
                'Добавить информацию',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          )),
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
