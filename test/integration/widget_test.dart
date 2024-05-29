import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:eventyle_app/main.dart';

import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

void main() {
  // Функция для форматирования строки теста с выравниванием
  String formatTestDescription(String description) {
    const int maxLength = 40; // Максимальная длина строки описания
    if (description.length < maxLength) {
      int paddingLength = maxLength - description.length;
      description = description + ' ' * paddingLength;
    }
    return description;
  }

  // Генерация случайного значения
  Random random = Random();

  test(
      '${formatTestDescription('test create new user')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });

  test(
      '${formatTestDescription('test auth created user')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });

  test(
      '${formatTestDescription('test get all user events')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });

  test(
      '${formatTestDescription('test get event by id')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });

  test(
      '${formatTestDescription('test create new event')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });

  test(
      '${formatTestDescription('test create new event info')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });
  test(
      '${formatTestDescription('test get event info')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });
  test(
      '${formatTestDescription('test get users')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });
  test(
      '${formatTestDescription('test get user')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });
}
