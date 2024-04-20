import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:eventyle_app/core/error/exception.dart';
import 'package:eventyle_app/features/event/data/models/event_model.dart';

abstract class EventRemoteDataSource {
  Future<List<EventModel>> getAllEvents();

  Future<void> addEvent(EventModel eventModel);
}

class EventRemoteDataSourceImpl implements EventRemoteDataSource {
  final http.Client client = http.Client();

  @override
  Future<List<EventModel>> getAllEvents() async {
    final response = await client.get(Uri.parse('http://10.0.2.2:8000/event/events/'));
    if (response.statusCode == 200) {
      final events = json.decode(utf8.decode(response.bodyBytes));
      return (events['events'] as List)
          .map((event) => EventModel.fromJson(event))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> addEvent(EventModel eventModel) {
    // TODO: implement addEvent
    throw UnimplementedError();
  }


  // @override
  // Future<void> addEvent(EventModel eventModel) async {
  //   print('addEvent() ${eventModel.name}');
  //   await addDataFromDB(eventModel);
  //   return Future.value();
  // }
  // //
  // Future fetchDataFromDB() async {
  //   final connection = await MySQL().getConnection();
  //
  //   await Future.delayed(const Duration(microseconds: 1));
  //
  //   var result = await connection.query(
  //       "SELECT id, name, DATE_FORMAT(date, '%d.%m.%Y') AS date, place, description FROM eventyle_app_test_db.event;");
  //
  //   connection.close();
  //
  //   return await refactorResult(result, 'events');
  // }
  //
  // Future addDataFromDB(EventModel eventModel) async {
  //   final connection = await MySQL().getConnection();
  //
  //   await Future.delayed(const Duration(microseconds: 1));
  //
  //   String formattedDate = formatDateToIso8601(eventModel.date);
  //
  //   print('formattedDate = ${formattedDate}');
  //
  //   // SQL-запрос для вставки нового события
  //   String sql =
  //       "INSERT INTO eventyle_app_test_db.event (name, date, place, description) VALUES (?, ?, ?, ?);";
  //
  //   // Выполнение запроса
  //   var result = await connection.query(sql, [
  //     eventModel.name,
  //     formattedDate,
  //     eventModel.place,
  //     eventModel.description
  //   ]);
  //
  //   await Future.delayed(const Duration(microseconds: 1));
  //
  //   connection.close();
  //
  //   // Проверка успешности операции
  //   if (result == 1) {
  //     print("Событие успешно добавлено в базу данных.");
  //   } else {
  //     print("Ошибка при добавлении события в базу данных.");
  //   }
  // }
  //
  // String formatDateToIso8601(String date) {
  //   // Разделение строки даты на день, месяц и год
  //   List<String> parts = date.split('.');
  //   int day = int.parse(parts[0]);
  //   int month = int.parse(parts[1]);
  //   int year = int.parse(parts[2]);
  //
  //   // Создание объекта DateTime
  //   DateTime dateTime = DateTime(year, month, day);
  //
  //   // Форматирование даты в строку в формате ISO 8601
  //   return dateTime.toIso8601String().split('T').first;
  // }
}
