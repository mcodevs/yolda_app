import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yolda_app/domain/common/enums/role.dart';

class DBService {
  /// Keys
  static const _dark = "is_dark";
  static const _isLogged = "is_logged";

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

  static Role? isLogged() {
    return null;
  }
}
