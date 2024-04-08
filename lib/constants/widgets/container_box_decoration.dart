import 'package:flutter/material.dart';

class CustomContainerBoxDecoration {
  static BoxDecoration customDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: Colors.grey,
      width: 0.1,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),
    ],
  );
}
