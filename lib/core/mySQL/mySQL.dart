import 'package:mysql1/mysql1.dart';

class MySQL {
  static String host = '10.0.2.2',
      user = 'root',
      password = '35723572',
      db = 'eventyle_app_test_db';
  static int port = 3306;

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: host,
        user: user,
        password: password,
        db: db,
        port: port,
        characterSet: CharacterSet.UTF8);

    return await MySqlConnection.connect(settings);
  }
}