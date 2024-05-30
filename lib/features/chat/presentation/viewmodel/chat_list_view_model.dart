import 'package:flutter/material.dart';

import '../../data/datasources/chat_remote_data_source.dart';
import '../../data/repositories/chat_repository_impl.dart';
import '../../domain/entities/chat_entity.dart';
import '../../domain/usecases/get_all_chat.dart';

class ChatListViewModel extends ChangeNotifier {
  final GetAllChatUseCase getAllChatUseCase = GetAllChatUseCase(
    chatRepository: ChatRepositoryImpl(
      chatRemoteDataSource: ChatRemoteDataSourceImpl(),
    ),
  );

  List<ChatEntity> listChats = [];

  Future<void> getListChats() async {
    listChats = await getAllChatUseCase.call(null);
    notifyListeners();
  }

  Future<void> onNewChatButtonPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/chatCreate');
  }

  Future<void> onChatPressed(BuildContext context, int index) async {
    Navigator.pushNamed(context, '/chatMain',
        arguments: {'chat': listChats[index]});
  }
}
