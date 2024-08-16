import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static late final SharedPreferences _prefs;

  Future<void> loginUser(String userName) async {
    try {
      _prefs.setString('username', userName);
    } catch (e) {
      throw Exception(e);
    }
  }

  void logoutUser() {
    _prefs.clear();
  }

  String? getUserName() {
    return _prefs.getString('username') ?? 'DefaultUsername';
  }

  Future<bool> isLoggedIn() async {
    return _prefs.containsKey('username');
  }

  void updateUserName(String newUserName) {
    _prefs.setString('username', newUserName);
    notifyListeners();
  }
}
