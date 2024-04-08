import 'package:flutter/material.dart';

class ListTileCard extends StatelessWidget {
  const ListTileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            // Убираем внутренний отступ ListTile
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/test_image.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: const Text('Two-line ListTile'),
            subtitle: const Text('Here is a second line'),
            // trailing: const Icon(
            //   Icons.add_circle,
            //   color: Colors.blue,
            // ),
          ),
        ),
      ),
    );
  }
}
