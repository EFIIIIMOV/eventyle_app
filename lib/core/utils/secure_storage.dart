import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> saveTokens(String accessToken, String refreshToken) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: 'accessToken', value: accessToken);
  await storage.write(key: 'refreshToken', value: refreshToken);
}

Future<String?> getAccessToken() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: 'accessToken');
}

Future<String?> getRefreshToken() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: 'refreshToken');
}
