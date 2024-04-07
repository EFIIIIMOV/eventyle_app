import 'package:eventyle_app/constants/theme/colors.dart';
import 'package:eventyle_app/constants/widgets/app_bar_widget.dart';
import 'package:eventyle_app/constants/widgets/bottom_bar_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/event_top_info.dart';

class EventMainView extends StatelessWidget {
  const EventMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1.0),
      appBar: const CustomAppBar(title: 'Мероприятие NAME',),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2,),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              EventTopInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
