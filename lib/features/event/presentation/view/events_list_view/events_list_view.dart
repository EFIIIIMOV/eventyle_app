import 'package:eventyle_app/features/event/presentation/view/events_list_view/widgets/list_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/events_list_view_model.dart';

class EventsListView extends StatefulWidget {
  const EventsListView({super.key});

  @override
  State<EventsListView> createState() => _EventsListViewState();
}

class _EventsListViewState extends State<EventsListView> {
  late final EventsListViewModel viewModel;

  @override
  void didChangeDependencies() {
    viewModel = context.read<EventsListViewModel>();
    viewModel.getListEvents();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Мероприятия',
        buttonIcon: Icons.add,
        onButtonPressed: () => context
            .read<EventsListViewModel>()
            .onNewEventButtonPressed(context),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2),
      body: RefreshIndicator(
        color: Colors.black,
        onRefresh: () async {
          await context.read<EventsListViewModel>().getListEvents();
        },
        child: Consumer<EventsListViewModel>(
          builder: (context, viewModel, child) {
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
          },
        ),
      ),
    );
  }
}
