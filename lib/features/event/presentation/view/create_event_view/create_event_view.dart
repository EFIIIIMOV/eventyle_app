import 'package:eventyle_app/features/event/presentation/view/create_event_view/widgets/event_create_users.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import 'widgets/event_create_top_info.dart';

class CreateEventView extends StatelessWidget {
  const CreateEventView({super.key});

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _dateController = TextEditingController();
    final _placeController = TextEditingController();
    final _infoDescriptionController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Новое мероприятие',
        buttonIcon: Icons.save,
        onButtonPressed: null,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentIndex: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                EventCreateTopInfo(
                  nameController: _nameController,
                  dateController: _dateController,
                  placeController: _placeController,
                  infoDescriptionController: _infoDescriptionController,
                ),
                SizedBox(height: 20),
                EventCreateUsers(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
