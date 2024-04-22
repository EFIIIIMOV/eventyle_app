import 'package:flutter/material.dart';

final ThemeData CustomThemeData = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 32,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.black,
        size: 30,
      ),
    ),
    primaryColor: Colors.white);

Theme customShowDatePickerTheme(Widget? child) {
  return Theme(
    data: ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.light(
        primary: Colors.black,
        onPrimary: Colors.white,
        onSurface: Colors.black,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.black),
      ),
    ),
    child: child!,
  );
}
