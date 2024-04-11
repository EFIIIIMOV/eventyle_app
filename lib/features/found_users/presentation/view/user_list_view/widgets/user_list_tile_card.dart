import 'package:flutter/material.dart';

class UserListTileCard extends StatelessWidget {
  const UserListTileCard({super.key});

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
              borderRadius: BorderRadius.circular(150.0),
              child: Image.asset(
                'assets/images/test_image.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: const Text('Имя Фамилия'),
            subtitle: const Text('Специальность'),
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
