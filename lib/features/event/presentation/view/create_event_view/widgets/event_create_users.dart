import 'package:eventyle_app/features/event/domain/entities/event_user_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/constants/theme/container_box_decoration.dart';
import '../../../viewmodel/create_event_view_model.dart';
import 'event_create_user_card.dart';

class EventCreateUsers extends StatelessWidget {
  final List<EventUserEntity> userList;
  final List<EventUserEntity> selectedUserList;
  final void Function(BuildContext context)? onTapDoneSelectUsersButton;
  final void Function(int index)? toggleUserSelected;
  final TextEditingController searchQuery;
  final void Function()? onTapSearchButton;

  const EventCreateUsers({
    Key? key,
    required this.userList,
    required this.selectedUserList,
    required this.onTapDoneSelectUsersButton,
    required this.toggleUserSelected,
    required this.searchQuery,
    required this.onTapSearchButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomContainerBoxDecoration.customDecoration,
      child: Column(
        children: [
          ListTile(
            onTap: () => _selectUserBottomSheet(
              context: context,
              userList: userList,
              onTapSelectUsersButton: onTapDoneSelectUsersButton,
              toggleUserSelected: toggleUserSelected,
              searchQuery: searchQuery,
              onTapSearchButton: onTapSearchButton,
            ),
            leading: const Icon(Icons.add, color: Colors.blue),
            title: const Text(
              'Добавить пользователя',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: generateSelectedUserList(selectedUserList),
          )
        ],
      ),
    );
  }
}

List<Widget> generateSelectedUserList(List<EventUserEntity> selectedUsers) =>
    selectedUsers.map((user) => ListUserItem(eventUserEntity: user)).toList();

void _selectUserBottomSheet({
  required BuildContext context,
  required List<EventUserEntity> userList,
  required void Function(BuildContext context)? onTapSelectUsersButton,
  required void Function(int index)? toggleUserSelected,
  required TextEditingController searchQuery,
  required void Function()? onTapSearchButton,
}) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.85,
    ),
    builder: (_) => Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Отмена',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              const Text(
                'Добавить',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              TextButton(
                onPressed: () => onTapSelectUsersButton?.call(context),
                child: const Text(
                  'Готово',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 1, color: Colors.black),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextField(
                    style: TextStyle(fontSize: 16),
                    controller: searchQuery,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      hintText: 'Поиск',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                padding: EdgeInsets.zero,
                iconSize: 25,
                onPressed: onTapSearchButton,
                icon: const Icon(
                  size: 25,
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const Divider(height: 1, thickness: 1, color: Colors.black),
        Expanded(child: Consumer<CreateEventViewModel>(
            builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.userList.length,
            itemBuilder: (context, index) => ListUserItem(
              onUserToggled: toggleUserSelected,
              eventUserEntity: viewModel.userList[index],
              index: index,
              showCheckbox: true,
            ),
          );
        })),
      ],
    ),
  );
}
