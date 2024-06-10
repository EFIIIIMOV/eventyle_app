import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/create_event_info_view_model.dart';
import 'widgets/event_create_info.dart';

class CreateEventInfoView extends StatefulWidget {
  const CreateEventInfoView({super.key});

  @override
  State<CreateEventInfoView> createState() => _CreateEventInfoViewState();
}

class _CreateEventInfoViewState extends State<CreateEventInfoView> {
  late final CreateEventInfoViewModel viewModel;
  late final TextEditingController infoNameController;
  late final TextEditingController infoDescriptionController;

  late final Map<String, dynamic>? args;
  late final String event_id;

  @override
  void initState() {
    infoNameController =
        TextEditingController();
    infoDescriptionController =
        TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    infoNameController.dispose();
    infoDescriptionController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    viewModel = context.read<CreateEventInfoViewModel>();
    args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    event_id = args?['event_id'];
    print(event_id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CreateEventInfoViewModel>();
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Новая информация',
        buttonIcon: Icons.save,
        onButtonPressed: () => viewModel.onSaveEventInfoButtonPressed(
          context: context,
          event_id: event_id,
          infoName: infoNameController.text,
          infoDescription: infoDescriptionController.text,
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: CreateEventInfo(
            infoNameController: infoNameController,
            infoDescriptionController: infoDescriptionController,
          ),
        ),
      ),
    );
  }
}
