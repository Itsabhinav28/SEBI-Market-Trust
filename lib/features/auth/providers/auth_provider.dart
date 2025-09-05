import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _userToken;
  Map<String, dynamic>? _userProfile;

  bool get isAuthenticated => _isAuthenticated;
  String? get userToken => _userToken;
  Map<String, dynamic>? get userProfile => _userProfile;

  void login(String token, Map<String, dynamic> profile) {
    _userToken = token;
    _userProfile = profile;
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    _userToken = null;
    _userProfile = null;
    _isAuthenticated = false;
    notifyListeners();
  }

  void updateProfile(Map<String, dynamic> profile) {
    _userProfile = profile;
    notifyListeners();
  }
}

