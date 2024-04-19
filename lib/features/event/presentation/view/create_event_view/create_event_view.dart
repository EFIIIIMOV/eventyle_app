import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:eventyle_app/features/event/presentation/view/create_event_view/widgets/event_create_users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/create_event_view_model.dart';
import 'widgets/event_create_top_info.dart';

class CreateEventView extends StatefulWidget {
  const CreateEventView({super.key});

  @override
  State<CreateEventView> createState() => _CreateEventViewState();
}

class _CreateEventViewState extends State<CreateEventView> {
  late final CreateEventViewModel viewModel;
  late final EventEntity eventEntity;
  late final TextEditingController _nameController;
  late final TextEditingController _dateController;
  late final TextEditingController _placeController;
  late final TextEditingController _infoDescriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "testEventName");
    _dateController = TextEditingController(text: "01.01.2000");
    _placeController = TextEditingController(text: "testEventPlace");
    _infoDescriptionController = TextEditingController(text: "testEventDescription");
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _placeController.dispose();
    _infoDescriptionController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    viewModel = context.read<CreateEventViewModel>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: 'Новое мероприятие',
        buttonIcon: Icons.save,
        onButtonPressed: () => viewModel.onSaveNewEventButtonPressed(
          context,
          name: _nameController.text,
          date: _dateController.text,
          place: _placeController.text,
          description: _infoDescriptionController.text,
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentIndex: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                EventCreateTopInfo(
                  nameController: _nameController,
                  dateController: _dateController,
                  placeController: _placeController,
                  infoDescriptionController: _infoDescriptionController,
                ),
                SizedBox(height: 20),
                EventCreateUsers(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
//
// class CreateEventView extends StatelessWidget {
//   const CreateEventView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final viewModel = context.read<CreateEventViewModel>();
//
//     return Scaffold(
//       backgroundColor: AppColors.viewSecondBackgroundColor,
//       appBar: CustomAppBar(
//         title: 'Новое мероприятие',
//         buttonIcon: Icons.save,
//         onButtonPressed: () => viewModel.onSaveNewEventButtonPressed(context),
//       ),
//       bottomNavigationBar: const CustomBottomNavigationBar(
//         currentIndex: 2,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Center(
//             child: Column(
//               children: [
//                 EventCreateTopInfo(
//                   nameController: _nameController,
//                   dateController: _dateController,
//                   placeController: _placeController,
//                   infoDescriptionController: _infoDescriptionController,
//                 ),
//                 SizedBox(height: 20),
//                 EventCreateUsers(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
