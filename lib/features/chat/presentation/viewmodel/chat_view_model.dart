import 'dart:convert';
import 'dart:io';

import 'package:eventyle_app/features/chat/data/datasources/chat_message_remote_data_source.dart';
import 'package:eventyle_app/features/chat/data/repositories/chat_message_repository_impl.dart';
import 'package:eventyle_app/features/chat/domain/usecases/get_all_chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../core/utils/token_util.dart';
import '../../data/datasources/chat_user_remote_data_source.dart';
import '../../data/repositories/chat_user_repository_impl.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../../domain/entities/chat_user_entity.dart';
import '../../domain/usecases/add_chat_message.dart';
import '../../domain/usecases/get_all_chat_user.dart';

class ChatViewModel extends ChangeNotifier {
  final GetAllChatMessageUseCase getAllChatMessageUseCase =
      GetAllChatMessageUseCase(
    chatMessageRepository: ChatMessageRepositoryImpl(
      chatMessageRemoteDataSource: ChatMessageRemoteDataSourceImpl(),
    ),
  );

  final GetAllChatUserUseCase getAllChatUserUseCase = GetAllChatUserUseCase(
    chatUserRepository: ChatUserRepositoryImpl(
      chatUserRemoteDataSource: ChatUserRemoteDataSourceImpl(),
    ),
  );

  final AddChatMessageUseCase addChatMessageUseCase = AddChatMessageUseCase(
    chatMessageRepository: ChatMessageRepositoryImpl(
      chatMessageRemoteDataSource: ChatMessageRemoteDataSourceImpl(),
    ),
  );

  String getBaseUrl() {
    if (Platform.isAndroid) {
      return '10.0.2.2'; // Android эмулятор
    } else if (Platform.isIOS) {
      return '127.0.0.1'; // iOS симулятор
    } else {
      return 'localhost'; // другие платформы
    }
  }

  // final WebSocketChannel channel = IOWebSocketChannel.connect(
  //     'ws://10.0.2.2:8080/ws/chat/nfjnn3jn432jn4j3n/');

  List<ChatMessageEntity> messageList = [];
  List<ChatUserEntity> userList = [];
  String userId = '';
  WebSocketChannel? channel;

  ChatViewModel() {
    if (Platform.isAndroid) {
      channel = IOWebSocketChannel.connect(
          'ws://10.0.2.2:8080/ws/chat/nfjnn3jn432jn4j3n/');
    } else if (Platform.isIOS) {
      channel = IOWebSocketChannel.connect(
          'ws://127.0.0.1:8080/ws/chat/nfjnn3jn432jn4j3n/');
    }
    channel!.stream.listen((message) {
      print(message.runtimeType);
      Map<String, dynamic> map = jsonDecode(message);
      print(map);
      // Преобразование внутреннего JSON-объекта, содержащего сообщение
      final innerJson = map["message"];

      // Создание объекта ChatMessageEntity из JSON-данных
      ChatMessageEntity newMessage = ChatMessageEntity(
        message_id: innerJson['message_id'],
        chat_id: innerJson['chat_id'],
        user_id: innerJson['user_id'],
        messageText: innerJson['messageText'],
        date: DateTime.now(),
      );

      messageList.add(newMessage);
      notifyListeners();
    });
  }

  Future<void> getListMessage({
    required String chat_id,
  }) async {
    messageList = await getAllChatMessageUseCase.call(chat_id);
    notifyListeners();
  }

  Future<void> getListUser({
    required String chat_id,
  }) async {
    userList = await getAllChatUserUseCase.call(chat_id);
    notifyListeners();
  }

  Future<void> sendMessage({
    required String chat_id,
    required String messageText,
  }) async {
    final message_id = Uuid().v4().replaceAll('-', '');
    ChatMessageEntity newMessage = ChatMessageEntity(
      message_id: message_id,
      chat_id: chat_id,
      user_id: "",
      messageText: messageText,
      date: DateTime.now(),
    );
    addChatMessageUseCase.call(newMessage);
    final newMessageJson = {
      "message_id": message_id,
      "chat_id": chat_id,
      "user_id": userId,
      "messageText": messageText,
      "date": '2022-05-12T12:00:00.000Z'
    };

// Преобразуйте объект JSON в строку и отправьте его через канал
    channel!.sink.add(jsonEncode(newMessageJson));
    notifyListeners();
  }

  Future<void> getUserId() async {
    final TokenUtil tokenUtil = TokenUtil(
      flutterSecureStorage: FlutterSecureStorage(),
      client: http.Client(),
    );
    String? token = await tokenUtil.getAccessToken();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
    userId = decodedToken['user_id'];
    print(userId);
  }
}
