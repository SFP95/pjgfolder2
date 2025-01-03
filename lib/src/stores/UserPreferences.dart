import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/users/user.dart';

class UserPreferences {
  static final String _kUserIdKey = 'userId';
  static final String _kTokenKey = 'token';

  static Future<void> initPreferences() async {
    await SharedPreferences.getInstance();
  }

  static Future<void> saveUserCredentials(User? user, String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (user != null) {
      String userJson = jsonEncode(user.toJson());
      await prefs.setString(_kUserIdKey, userJson);
    }
    if (token != null) {
      await prefs.setString(_kTokenKey, token);
    }
  }

  static Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_kUserIdKey);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kTokenKey);
  }

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kTokenKey, token);
  }
}
