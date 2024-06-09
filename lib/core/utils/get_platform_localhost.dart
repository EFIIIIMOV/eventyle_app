import 'dart:io' show Platform;

String getBaseUrl() {
  if (Platform.isAndroid) {
    return 'http://10.0.2.2:8000'; // Android эмулятор
  } else if (Platform.isIOS) {
    return 'http://127.0.0.1:8000'; // iOS симулятор
  } else {
    return 'http://localhost:8000'; // другие платформы
  }
}
