import 'package:eventyle_app/features/event/presentation/view/events_list_view/widgets/list_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/events_list_view_model.dart';

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
      body: FutureBuilder(
        future: viewModel.getListEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: viewModel.listEvents.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => viewModel.onEventPressed(context, index),
                  child: ListTileCard(
                    eventTitle: viewModel.listEvents[index].name,
                    eventDate: viewModel.listEvents[index].date,
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
