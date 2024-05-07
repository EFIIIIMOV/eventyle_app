import 'dart:typed_data';

import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:eventyle_app/features/event/presentation/view/create_event_view/widgets/event_create_users.dart';
import 'package:eventyle_app/features/event/presentation/view/create_event_view/widgets/event_select_date.dart';
import 'package:eventyle_app/features/event/presentation/view/create_event_view/widgets/event_select_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/create_event_view_model.dart';
import 'widgets/event_create_main_info.dart';

class CreateEventView extends StatefulWidget {
  const CreateEventView({super.key});

  @override
  State<CreateEventView> createState() => _CreateEventViewState();
}

class _CreateEventViewState extends State<CreateEventView> {
  late final CreateEventViewModel viewModel;
  late final EventEntity eventEntity;
  late final TextEditingController _nameController;
  late final TextEditingController _placeController;
  late final TextEditingController _infoDescriptionController;
  late final TextEditingController _searchQuery;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "testEventName");
    _placeController = TextEditingController(text: "testEventPlace");
    _infoDescriptionController =
        TextEditingController(text: "testEventDescription");
    _searchQuery = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _placeController.dispose();
    _infoDescriptionController.dispose();
    _searchQuery.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    viewModel = context.read<CreateEventViewModel>();
    await viewModel.getEventUsers();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Новое мероприятие',
        buttonIcon: Icons.save,
        onButtonPressed: () => viewModel.eventSelectDate != null
            ? viewModel.onSaveNewEventButtonPressed(
                context,
                name: _nameController.text,
                place: _placeController.text,
                description: _infoDescriptionController.text,
              )
            : ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Дата не указана"),
                ),
              ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Consumer<CreateEventViewModel>(
                  builder: (context, viewModel, child) {
                    return EventSelectImage(
                      selectedImage: viewModel.eventSelectedImage,
                      onTap: () => viewModel.updateImageField(),
                    );
                  },
                ),
                SizedBox(height: 30),
                Consumer<CreateEventViewModel>(
                  builder: (context, viewModel, child) {
                    return EventSelectDate(
                      eventSelectDate: viewModel.eventSelectDate,
                      onTap: () => viewModel.updateDateField(context),
                    );
                  },
                ),
                SizedBox(height: 20),
                EventCreateMainInfo(
                  nameController: _nameController,
                  placeController: _placeController,
                  infoDescriptionController: _infoDescriptionController,
                ),
                SizedBox(height: 20),
                EventCreateUsers(
                  userList: viewModel.userList,
                  selectedUserList: viewModel.selectedUserList,
                  toggleUserSelected: viewModel.toggleUserSelected,
                  searchQuery: _searchQuery,
                  onTapSearchButton: () =>
                      viewModel.filterResult(_searchQuery.text!),
                  isUserSelected: viewModel.isUserSelected,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
