import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DBService {
  /// Keys
  static const _dark = "is_dark";
  static const _isUserLogged = "is_user_logged";

  static SharedPreferences? _storage;

  static SharedPreferences get storage => _storage!;

  static Future<void> initialize() async {
    _storage = await SharedPreferences.getInstance();
  }

  static ThemeMode get theme =>
      (storage.getBool(_dark) ?? false) ? ThemeMode.dark : ThemeMode.light;

  static Future<void> changeTheme(ThemeMode mode) async {
    await storage.setBool(_dark, mode == ThemeMode.dark ? true : false);
  }

  static String? isLogged() {
    return storage.getString(_isUserLogged);
  }

  static Future<void> saveLogged(String phoneNumber) async {
    await storage.setString(_isUserLogged, phoneNumber);
  }

  static Future<void> removeUser() async {
    await storage.remove(_isUserLogged);
  }
}
