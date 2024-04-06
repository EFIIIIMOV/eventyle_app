import 'package:flutter/material.dart';

import '../../../../constants/theme/fonts.dart';

class SignTitle extends StatelessWidget {
  final String signTitle;

  const SignTitle({super.key, required this.signTitle});

  @override
  Widget build(BuildContext context) {
    return Text(signTitle, style: AppFonts.signTitleTextStyle);
  }
}
