import 'package:flutter/material.dart';

class ChatListViewModel extends ChangeNotifier {
  ChatListViewModel();

  Future<void> onNewChatButtonPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/chatCreate');
  }

  Future<void> onChatPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/chatMain');
  }
}
