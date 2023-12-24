import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DBService {
  /// Keys
  static const _logged = "is_logged";
  static const _dark = "is_dark";

  static SharedPreferences? _storage;

  static SharedPreferences get storage => _storage!;

  static Future<void> initialize() async {
    _storage = await SharedPreferences.getInstance();
  }

  static bool get isLogged => storage.getBool(_logged) ?? false;

  static ThemeMode get theme =>
      (storage.getBool(_dark) ?? false) ? ThemeMode.dark : ThemeMode.light;

  static Future<void> changeTheme(ThemeMode mode) async {
    await storage.setBool(_dark, mode == ThemeMode.dark ? true : false);
  }
}
