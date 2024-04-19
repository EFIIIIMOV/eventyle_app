import 'package:eventyle_app/features/event/presentation/viewmodel/event_main_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/widgets/container_box_decoration.dart';
import '../../../../domain/entities/event_info_entity.dart';

class EventListInfo extends StatelessWidget {
  final String eventName;
  final EventMainViewModel eventMainViewModel;
  final List<EventInfoEntity> eventInfoEntity;

  EventListInfo(
      {Key? key,
      required this.eventInfoEntity,
      required this.eventMainViewModel,
      required this.eventName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomContainerBoxDecoration.customDecoration,
      child: Column(
        children: [
          ListTile(
            onTap: () => eventMainViewModel.onNewInfoButtonPressed(context),
            leading: const Icon(Icons.add, color: Colors.blue),
            title: const Text('Добавить информацию',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(height: 0, thickness: 0.5, color: Colors.grey),
          ),
          ...generateList(context),
        ],
      ),
    );
  }

  List<Widget> generateList(BuildContext context) {
    return [
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: eventInfoEntity.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () =>
                eventMainViewModel.onInfoPressed(context, index, eventName),
            title: Text(eventInfoEntity[index].name),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              height: 0,
              thickness: 0.5,
              color: Colors.grey,
            ),
          );
        },
      ),
    ];
  }
}