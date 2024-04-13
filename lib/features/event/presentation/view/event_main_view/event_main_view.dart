import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/widgets/app_bar_widget.dart';
import '../../../../../core/constants/widgets/bottom_bar_widget.dart';
import '../../viewmodel/event_main_view_model.dart';
import 'widgets/event_list_info.dart';
import 'widgets/event_top_info.dart';

class EventMainView extends StatefulWidget {
  const EventMainView({super.key});

  @override
  State<EventMainView> createState() => _EventMainViewState();
}

class _EventMainViewState extends State<EventMainView> {
  late EventEntity eventEntity;

  @override
  void didChangeDependencies() {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    eventEntity = args['event'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<EventMainViewModel>();
    return Scaffold(
      backgroundColor: AppColors.viewSecondBackgroundColor,
      appBar: CustomAppBar(
        title: eventEntity.name,
        buttonIcon: Icons.edit,
        onButtonPressed: null,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 2),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              EventTopInfo(),
              SizedBox(height: 15),
              EventListInfo(
                  onTap: () => viewModel.onNewInfoButtonPressed(context)),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

//
// class EventMainView extends StatelessWidget {
//   const EventMainView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final viewModel = context.read<EventMainViewModel>();
//     return Scaffold(
//       backgroundColor: AppColors.viewSecondBackgroundColor,
//       appBar: const CustomAppBar(
//         title: 'Название мероприятия',
//         buttonIcon: Icons.edit,
//         onButtonPressed: null,
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 2),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             children: [
//               EventTopInfo(),
//               SizedBox(height: 15),
//               EventListInfo(
//                   onTap: () => viewModel.onNewInfoButtonPressed(context)),
//               SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
