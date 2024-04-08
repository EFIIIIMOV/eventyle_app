import 'package:eventyle_app/constants/theme/colors.dart';
import 'package:eventyle_app/constants/widgets/app_bar_widget.dart';
import 'package:eventyle_app/constants/widgets/bottom_bar_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/event_list_info.dart';
import '../widgets/event_top_info.dart';

class EventMainView extends StatelessWidget {
  const EventMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Мероприятие NAME',
        buttonIcon: Icons.edit,
        onButtonPressed: null,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EventTopInfo(),
            EventListInfo(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
