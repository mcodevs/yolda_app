import 'package:flutter/material.dart';
import 'package:yolda_app/infrastructure/services/db_service.dart';

class ThemePreferences {
  ThemeMode getMode() => DBService.theme;

  Future<void> setMode(ThemeMode mode) async =>
      await DBService.changeTheme(mode);

  Future<void> clean() async => await DBService.storage.clear();
}
