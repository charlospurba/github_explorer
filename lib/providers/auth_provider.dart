import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  bool get isAuthenticated => _token != null;

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  String? get token => _token;
}
