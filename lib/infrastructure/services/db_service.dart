import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yolda_app/infrastructure/models/auth/token.dart';

class DBService {
  /// Keys
  static const _dark = "is_dark";
  static const _token = "token";

  static Token? _userToken;

  static SharedPreferences? _storage;

  static SharedPreferences get storage => _storage!;
  static Token get token => _userToken!;
  static bool get isHaveToken => _userToken != null;

  static Future<void> initialize() async {
    _storage = await SharedPreferences.getInstance();
  }

  static ThemeMode get theme =>
      (storage.getBool(_dark) ?? false) ? ThemeMode.dark : ThemeMode.light;

  static Future<void> changeTheme(ThemeMode mode) async {
    await storage.setBool(_dark, mode == ThemeMode.dark ? true : false);
  }

  static Token? getToken() {
    final stringToken = storage.getString(_token);
    if (stringToken == null) {
      return null;
    } else {
      _userToken = Token.fromJson(jsonDecode(stringToken));
      return _userToken;
    }
  }
}
