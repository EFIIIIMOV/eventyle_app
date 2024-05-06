import 'package:eventyle_app/core/constants/theme/colors.dart';
import 'package:eventyle_app/core/constants/widgets/app_bar_widget.dart';
import 'package:eventyle_app/core/constants/theme/container_box_decoration.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/event_info_entity.dart';

class EventInfoView extends StatelessWidget {
  const EventInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final EventInfoEntity eventInfoEntity =
        args?['eventInfo'] as EventInfoEntity;
    final String eventName = args?['eventName'] as String;

    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: eventName,
        buttonIcon: null,
        onButtonPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Container(
            decoration: CustomContainerBoxDecoration.customDecoration,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventInfoEntity.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 0,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(eventInfoEntity.description),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
