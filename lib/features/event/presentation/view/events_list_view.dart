import 'package:flutter/material.dart';

import '../../../../constants/theme/colors.dart';
import '../../../../constants/widgets/app_bar_widget.dart';
import '../../../../constants/widgets/bottom_bar_widget.dart';
import '../widgets/events_list_tile.dart';

class EventsListView extends StatelessWidget {
  const EventsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewBackgroundColor,
      appBar: const CustomAppBar(title: 'Мероприятия'),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
      ),
      body: SafeArea(
        child: EventsListTile(),
      ),
    );
  }
}
