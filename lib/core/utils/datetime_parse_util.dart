import 'package:intl/intl.dart';

String dateTimeParseUtil(DateTime dateTime) {
  return DateFormat('dd.MM.yyyy').format(dateTime!).toString();
}
