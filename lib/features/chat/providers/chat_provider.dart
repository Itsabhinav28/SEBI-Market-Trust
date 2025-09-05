import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _messages = [];
  bool _isTyping = false;
  String _currentChatId = '';

  List<Map<String, dynamic>> get messages => _messages;
  bool get isTyping => _isTyping;
  String get currentChatId => _currentChatId;

  void setCurrentChat(String chatId) {
    _currentChatId = chatId;
    notifyListeners();
  }

  void addMessage(Map<String, dynamic> message) {
    _messages.add(message);
    notifyListeners();
  }

  void setTypingStatus(bool status) {
    _isTyping = status;
    notifyListeners();
  }

  void clearMessages() {
    _messages.clear();
    notifyListeners();
  }
}

