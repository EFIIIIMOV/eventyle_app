import 'package:eventyle_app/features/event/domain/entities/event_user_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/constants/theme/container_box_decoration.dart';
import '../../../viewmodel/create_event_view_model.dart';
import 'event_create_user_card.dart';

class EventCreateUsers extends StatefulWidget {
  final List<EventUserEntity> selectedUserList;
  final TextEditingController searchQuery;
  final void Function()? onTapSearchButton;
  final void Function() getEventUsers;

  const EventCreateUsers({
    super.key,
    required this.selectedUserList,
    required this.searchQuery,
    required this.onTapSearchButton,
    required this.getEventUsers,
  });

  @override
  State<EventCreateUsers> createState() => _EventCreateUsersState();
}

class _EventCreateUsersState extends State<EventCreateUsers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomContainerBoxDecoration.customDecoration,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: false,
                useRootNavigator: true,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.85,
                ),
                builder: (context) {
                  return CustomBottomSheet(
                    searchQuery: widget.searchQuery,
                    onTapSearchButton: widget.onTapSearchButton,
                    getEventUsers: widget.getEventUsers,
                  );
                },
              );
            },
            leading: const Icon(
              Icons.add,
              color: Colors.blue,
            ),
            title: const Text(
              'Добавить пользователя',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Consumer<CreateEventViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                children: generateSelectedUserList(
                  widget.selectedUserList,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  List<Widget> generateSelectedUserList(List<EventUserEntity> selectedUsers) =>
      selectedUsers.map((user) => UserListCard(eventUserEntity: user)).toList();
}

class CustomBottomSheet extends StatefulWidget {
  final TextEditingController searchQuery;
  final void Function()? onTapSearchButton;
  final void Function() getEventUsers;

  const CustomBottomSheet({
    super.key,
    required this.searchQuery,
    required this.onTapSearchButton,
    required this.getEventUsers,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  void didChangeDependencies() {
    widget.getEventUsers();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                onPressed: () => Navigator.pop(context),
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
                    controller: widget.searchQuery,
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
                onPressed: widget.onTapSearchButton,
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
        Expanded(
          child: Consumer<CreateEventViewModel>(
            builder: (context, viewModel, child) {
              return ListView.builder(
                itemCount: viewModel.userList.length,
                itemBuilder: (context, index) {
                  return UserListCard(
                    eventUserEntity: viewModel.userList[index],
                    isUserSelected: viewModel.isUserSelected,
                    toggleUserSelected: viewModel.toggleUserSelected,
                    userIndex: index,
                    showCheckbox: true,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
