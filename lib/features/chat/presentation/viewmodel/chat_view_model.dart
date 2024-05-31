import 'package:eventyle_app/features/chat/data/datasources/chat_message_remote_data_source.dart';
import 'package:eventyle_app/features/chat/data/repositories/chat_message_repository_impl.dart';
import 'package:eventyle_app/features/chat/domain/usecases/get_all_chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

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

  ChatViewModel();

  List<ChatMessageEntity> messageList = [];
  List<ChatUserEntity> userList = [];
  String userId = '';

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
    ChatMessageEntity newMessage = ChatMessageEntity(
      message_id: Uuid().v4().replaceAll('-', ''),
      chat_id: chat_id,
      user_id: "",
      messageText: messageText,
      date: DateTime.now(),
    );
    addChatMessageUseCase.call(newMessage);
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
