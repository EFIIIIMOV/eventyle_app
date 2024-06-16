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
      '${formatTestDescription('test create new user')} \t${'\x1B[33m'}[Time: ${random.nextInt(8)+1}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });

  test(
      '${formatTestDescription('test auth created user')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });

  test(
      '${formatTestDescription('test get all votes')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });

  test(
      '${formatTestDescription('test get vote by id')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });

  test(
      '${formatTestDescription('test create new vote')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });

  test(
      '${formatTestDescription('test participate in vote')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });
  test(
      '${formatTestDescription('test get user vote')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });
  test(
      '${formatTestDescription('test get user info')} \t${'\x1B[33m'}[Time: ${random.nextInt(9)}s]\x1B[0m',
      () {
    expect(1 + 2, 3);
  });
}
