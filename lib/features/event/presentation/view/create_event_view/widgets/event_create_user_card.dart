import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entities/event_user_entity.dart';
import '../../../viewmodel/create_event_view_model.dart';

class ListUserItem extends StatelessWidget {
  final void Function(int index)? onUserToggled;
  final EventUserEntity eventUserEntity;
  final int? index;
  final bool? showCheckbox;

  const ListUserItem({
    super.key,
    required this.eventUserEntity,
    this.index,
    this.onUserToggled,
    this.showCheckbox,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(height: 1, thickness: 1, color: Colors.grey),
        ),
        ListTile(
          onTap: onUserToggled == null ? () {} : () => onUserToggled!(index!),
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          leading: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.account_circle_rounded,
              color: Colors.blue,
              size: 45,
            ),
          ),
          title: Text('${eventUserEntity.name} ${eventUserEntity.name}'),
          subtitle: Text(eventUserEntity.role),
          trailing: showCheckbox == true
              ? Consumer<CreateEventViewModel>(
                  builder: (context, viewModel, child) {
                    return Checkbox(
                      activeColor: Colors.black,
                      value: eventUserEntity.isSelected,
                      onChanged: (value) => onUserToggled!(index!),
                    );
                  },
                )
              : const SizedBox(),
        )
      ],
    );
  }
}
