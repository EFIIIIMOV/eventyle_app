import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../constants/theme/colors.dart';
import '../../../../../constants/widgets/app_bar_widget.dart';
import '../../../../../constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/events_list_view_model.dart';
import 'widgets/events_list_tile.dart';

class EventsListView extends StatelessWidget {
  const EventsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<EventsListViewModel>();
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Мероприятия',
        buttonIcon: Icons.add,
        onButtonPressed: () => viewModel.onNewEventButtonPressed(context),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2),
      body: EventsListTile(
        onTap: () => viewModel.onEventPressed(context),
      ),
    );
  }
}
