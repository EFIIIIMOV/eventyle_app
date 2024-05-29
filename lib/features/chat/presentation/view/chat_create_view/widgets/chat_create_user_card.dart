import 'package:flutter/material.dart';

import '../../../../../../core/constants/widgets/create_image_widget.dart';
import '../../../../domain/entities/chat_user_entity.dart';

class UserListCard extends StatelessWidget {
  final ChatUserEntity eventUserEntity;
  final int? userIndex;
  final bool? showCheckbox;
  final void Function(int userIndex)? toggleUserSelected;
  final bool Function(String user_id)? isUserSelected;

  const UserListCard({
    super.key,
    required this.eventUserEntity,
    this.userIndex,
    this.showCheckbox,
    this.toggleUserSelected,
    this.isUserSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: userIndex == 0
              ? const SizedBox()
              : const Divider(height: 1, thickness: 1, color: Colors.grey),
        ),
        ListTile(
          onTap: toggleUserSelected == null
              ? () {}
              : () => toggleUserSelected!(userIndex!),
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CreateImageWidget(
                borderRadiusCircular: 150,
                containerSize: 50,
                imageUrl:
                    'http://10.0.2.2:8000/user/profile/image/?user_id=${eventUserEntity.user_id.replaceAll('-', '')}'),
          ),
          title: Text('${eventUserEntity.name} ${eventUserEntity.surname}'),
          subtitle: Text(eventUserEntity.role),
          trailing: showCheckbox == true
              ? Checkbox(
                  activeColor: Colors.black,
                  value: isUserSelected!(eventUserEntity.user_id!),
                  onChanged: (value) => toggleUserSelected!(userIndex!),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
