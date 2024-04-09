import 'package:eventyle_app/constants/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black.withOpacity(0.2), // Цвет полоски
              width: 1, // Толщина полоски
            ),
          ),
        ),
        child: BottomNavigationBar(
          selectedFontSize: 13,
          unselectedFontSize: 13,
          backgroundColor: AppColors.appBarBackgroundColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedItemColor: Colors.blue,
          onTap: (index) => onTabTapped(context, index, currentIndex),
          items: const [
            BottomNavigationBarItem(
              label: 'Подрядчики',
              icon: Icon(Icons.group_add),
            ),
            BottomNavigationBarItem(
              label: 'Чаты',
              icon: Icon(Icons.messenger_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Мероприятия',
              icon: Icon(Icons.event_note),
            ),
            BottomNavigationBarItem(
              label: 'Профиль',
              icon: Icon(Icons.account_circle_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

void onTabTapped(BuildContext context, int index, int currentIndex) {
  // Определение маршрутов для каждой страницы
  final Map<int, String> routes = {
    0: '/userList',
    1: '/chatList',
    2: '/',
    3: '/profile',
  };

  if (index != currentIndex) {
    // Переход на соответствующую страницу
    Navigator.pushReplacementNamed(context, routes[index]!);
  }
}
