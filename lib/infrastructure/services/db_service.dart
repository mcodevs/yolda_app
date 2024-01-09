import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yolda_app/domain/common/enums/role.dart';
import 'package:yolda_app/infrastructure/models/auth/local_model.dart';

class DBService {
  /// Keys
  static const _dark = "is_dark";
  static const _isUserLogged = "is_UserLogged";

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
    final data = storage.getString(_isUserLogged);
    LocalUserModel? localUserModel = data != null ? LocalUserModel.fromJson(jsonDecode(data)) : null;
    return localUserModel?.role;
  }

  static Future<void> saveLogged(LocalUserModel localUserModel)async {
    await storage.setString(_isUserLogged, jsonEncode(localUserModel.toJson()));
  }
}
