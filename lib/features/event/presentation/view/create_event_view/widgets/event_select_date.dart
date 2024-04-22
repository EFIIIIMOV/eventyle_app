import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/constants/theme/themeData.dart';
import '../../../../../../core/constants/widgets/container_box_decoration.dart';
import '../../../../../../core/utils/datetime_parse_util.dart';
import '../../../viewmodel/create_event_view_model.dart';

class EventSelectDate extends StatelessWidget {
  final DateTime? eventSelectDate;
  final void Function()? onTap;

  const EventSelectDate({
    super.key,
    required this.eventSelectDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: CustomContainerBoxDecoration.customDecoration,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Дата мероприятия',
                textAlign: TextAlign.left,
              ),
              eventSelectDate != null
                  ? Text(dateTimeParseUtil(eventSelectDate!),
                      style: const TextStyle(color: Colors.grey),
                      textAlign: TextAlign.right)
                  : const Text('Указать',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.right),
            ],
          ),
        ),
      ),
    );
  }
}
