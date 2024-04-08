import 'package:flutter/material.dart';

import '../../../../constants/theme/colors.dart';
import '../../../../constants/widgets/app_bar_widget.dart';
import '../../../../constants/widgets/bottom_bar_widget.dart';
import '../widgets/event_create_info.dart';
import '../widgets/event_create_top_info.dart';
import '../widgets/event_create_users.dart';

class CreateEventInfoView extends StatelessWidget {
  const CreateEventInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Информация',
        buttonIcon: Icons.save,
        onButtonPressed: null,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                CreateEventInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
