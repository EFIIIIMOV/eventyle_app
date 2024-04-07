import 'package:flutter/material.dart';

class ListTileCard extends StatelessWidget {
  const ListTileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Определяем ширину экрана
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      // Устанавливаем ширину контейнера равной ширине экрана
      decoration: BoxDecoration(
        color: Colors.white, // Устанавливаем цвет фона контейнера в белый
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300, // Устанавливаем цвет рамки снизу
            width: 1, // Устанавливаем толщину рамки снизу
          ),
        ),
      ),
      child: ListTile(
        leading: FlutterLogo(size: 56.0),
        title: Text('Two-line ListTile'),
        subtitle: Text('Here is a second line'),
        trailing: Icon(
          Icons.add_circle,
          color: Colors.blue,
        ),
      ),
    );
  }
}
