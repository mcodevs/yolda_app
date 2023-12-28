import 'package:flutter/material.dart';

import 'package:yolda_app/presentation/styles/colors.dart';
import 'package:yolda_app/presentation/styles/fonts.dart';
import 'package:yolda_app/presentation/styles/icons.dart';
import 'package:yolda_app/presentation/styles/theme_preferences.dart';

class CustomTheme with ChangeNotifier {
  final ThemePreferences _preferences;

  final IconSet _icons;
  FontSet _fonts;
  ColorSet _colors;
  ThemeMode _mode;

  CustomTheme._(
    this._preferences,
    this._icons,
    this._fonts,
    this._colors,
    this._mode,
  );

  static CustomTheme create() {
    final themePreference = ThemePreferences();
    final mode = themePreference.getMode();
    final colorSet = ColorSet.create(mode);
    final iconSet = IconSet.create();
    final fontSet = FontSet.create(colorSet);
    return CustomTheme._(
      themePreference,
      iconSet,
      fontSet,
      colorSet,
      mode,
    );
  }

  /// Getters
  ColorSet get colors => _colors;
  FontSet get fonts => _fonts;
  IconSet get icons => _icons;
  ThemeMode get mode => _mode;

  /// Update theme mode
  Future<void> _update(ThemeMode mode) async {
    _colors = ColorSet.create(mode);
    _fonts = FontSet.create(_colors);
    _mode = mode;
    notifyListeners();
    await _preferences.setMode(mode);
  }

  /// Set light mode
  Future<void> setLight() async => await _update(ThemeMode.light);

  /// Set dark mode
  Future<void> setDark() async => await _update(ThemeMode.dark);

  /// Clean storage
  Future<void> clean() async => await _preferences.clean();

  Future<void> toggle() async {
    if (mode == ThemeMode.dark) {
      await setLight();
    } else {
      await setDark();
    }
  }
}
