import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/event_main_view_model.dart';
import 'widgets/event_list_info.dart';
import 'widgets/event_top_info.dart';

class EventMainView extends StatelessWidget {
  const EventMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<EventMainViewModel>();
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final EventEntity eventEntity = args?['event'] as EventEntity;

    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: eventEntity.name,
        buttonIcon: Icons.edit,
        onButtonPressed: () => viewModel.onEditEventButtonPressed(context),
      ),
      body: FutureBuilder(
        future: viewModel.getListEventInfo(eventEntity.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    EventTopInfo(
                      eventDate: eventEntity.date,
                      eventPlace: eventEntity.place,
                      eventDescription: eventEntity.description,
                    ),
                    const SizedBox(height: 15),
                    EventListInfo(
                      eventInfoEntity: viewModel.listEventInfo,
                      eventMainViewModel: viewModel,
                      eventName: eventEntity.name,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
