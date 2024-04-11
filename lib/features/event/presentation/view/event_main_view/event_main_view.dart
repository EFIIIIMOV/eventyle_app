import 'package:eventyle_app/constants/theme/colors.dart';
import 'package:eventyle_app/constants/widgets/app_bar_widget.dart';
import 'package:eventyle_app/constants/widgets/bottom_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/event_main_view_model.dart';
import 'widgets/event_list_info.dart';
import 'widgets/event_top_info.dart';

class EventMainView extends StatelessWidget {
  const EventMainView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<EventMainViewModel>();
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Название мероприятия',
        buttonIcon: Icons.edit,
        onButtonPressed: null,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 2),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              EventTopInfo(),
              SizedBox(height: 15),
              EventListInfo(onTap: () => viewModel.onNewInfoButtonPressed(context)),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
