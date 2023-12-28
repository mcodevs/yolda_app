import 'package:flutter/material.dart';
import 'package:yolda_app/presentation/styles/style.dart';

class ColorSet {
  final Color white;
  final Color black;
  final Color primaryTextColor;
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color scaffoldBGColor;

  const ColorSet._({
    required this.white,
    required this.black,
    required this.primaryTextColor,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.scaffoldBGColor,
  });

  factory ColorSet._light() {
    return const ColorSet._(
      white: Style.white,
      black: Style.black,
      primaryTextColor: Style.black,
      primary: Style.green,
      onPrimary: Style.darkGreen,
      secondary: Style.purple,
      scaffoldBGColor: Style.white,
    );
  }

  factory ColorSet._dark() {
    return const ColorSet._(
      white: Style.white,
      black: Style.black,
      primaryTextColor: Style.white,
      primary: Style.green,
      onPrimary: Style.darkGreen,
      secondary: Style.purple,
      scaffoldBGColor: Style.white,
    );
  }

  factory ColorSet.create(ThemeMode mode) {
    if (mode == ThemeMode.dark) {
      return ColorSet._dark();
    } else {
      return ColorSet._light();
    }
  }
}
