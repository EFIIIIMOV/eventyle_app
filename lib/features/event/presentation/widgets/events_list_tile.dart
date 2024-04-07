import 'package:flutter/material.dart';
import 'list_tile_card.dart';

class EventsListTile extends StatelessWidget {
  const EventsListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/signUp');
            print('Элемент списка нажат: $index');
          },
          child: ListTileCard(),
        );
      },
    );
  }
}
