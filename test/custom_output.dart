import 'dart:convert';
import 'dart:io';

void main() async {
  // Запускаем команду flutter test -r expanded и перехватываем вывод
  ProcessResult result =
      await Process.run('flutter', ['test', '-r', 'expanded']);

  // Обрабатываем вывод команды и добавляем [PASSED] к каждой строке, которая начинается с временной метки
  LineSplitter ls = LineSplitter();
  List<String> lines = ls.convert(result.stdout.toString());
  for (String line in lines) {
    if (!line.contains('loading') && !line.contains('All tests passed!')) {
      // Разделяем строку по пробелам и выбираем вторую часть, начиная с символа "+"
      String cleanedLine = line.split(' +').sublist(1).join(' +');
      // Выводим строку без временной метки и добавляем [PASSED]
      print('+$cleanedLine\t\x1B[32m[PASSED]\x1B[0m');
    } else if (line.contains('All tests passed!')) {
      // Делаем строку полностью зеленой и без [PASSED]
      print('\x1B[32m$line\x1B[0m');
    }
  }
}
