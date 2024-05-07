import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/constants/widgets/create_image_widget.dart';
import '../../../../domain/entities/event_user_entity.dart';

class ListUserItem extends StatelessWidget {
  final void Function(int index)? onUserToggled;
  final bool Function(String user_id)? isUserSelected;
  final EventUserEntity eventUserEntity;
  final int? index;
  final bool? showCheckbox;

  const ListUserItem({
    super.key,
    required this.eventUserEntity,
    this.index,
    this.onUserToggled,
    this.showCheckbox,
    this.isUserSelected,
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
          //onTap: onUserToggled == null ? () {} : () => onUserToggled!(index!),
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: CreateImageWidget(
                borderRadiusCircular: 150,
                containerSize: 50,
                imageUrl:
                    'http://10.0.2.2:8000/user/profile/image/?user_id=${eventUserEntity.user_id.replaceAll('-', '')}'),
          ),
          title: Text('${eventUserEntity.name} ${eventUserEntity.name}'),
          subtitle: Text(eventUserEntity.role),
          trailing: showCheckbox == true
              ? Checkbox(
                  activeColor: Colors.black,
                  value: isUserSelected!(eventUserEntity.user_id!),
                  onChanged: (value) => onUserToggled!(index!),
                )
              : const SizedBox(),
        )
      ],
    );
  }
}
