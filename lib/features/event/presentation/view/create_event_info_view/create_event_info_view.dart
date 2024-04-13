import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/create_event_info_view_model.dart';
import 'widgets/event_create_info.dart';

class CreateEventInfoView extends StatelessWidget {
  const CreateEventInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CreateEventInfoViewModel>();
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Информация',
        buttonIcon: Icons.save,
        onButtonPressed: null,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: CreateEventInfo(),
        ),
      ),
    );
  }
}
