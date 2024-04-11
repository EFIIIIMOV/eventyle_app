import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodel/events_list_view_model.dart';
import 'list_tile_card.dart';

class EventsListTile extends StatelessWidget {
  final VoidCallback onTap;

  const EventsListTile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: onTap,
          child: const ListTileCard(),
        );
      },
    );
  }
}
