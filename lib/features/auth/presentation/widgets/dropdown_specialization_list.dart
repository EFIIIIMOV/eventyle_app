import 'package:flutter/material.dart';
import '../../../../core/constants/theme/colors.dart';
import '../viewmodel/sign_up_user_info_view_model.dart';

class DropDownSpecializationList extends StatelessWidget {
  final String? profileSpecialization;
  final List<String> profileSpecializations;
  final void Function(String?)? onChanged;

  const DropDownSpecializationList({
    super.key,
    required this.onChanged,
    required this.profileSpecialization,
    required this.profileSpecializations,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.viewBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColors.appBarTextColor),
        ),
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: const SizedBox(),
          value: profileSpecialization,
          items: profileSpecializations.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
