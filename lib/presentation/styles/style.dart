import 'package:flutter/material.dart';

class Style {
  /// Colors
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const green = Color(0xFF34A853);
  static const darkGreen = Color(0xFF2DB57D);
  static const purple = Color(0xFFA027FF);
  static const red = Color(0xFFFF5252);

  /// Fonts
  static TextStyle righteousRegular({
    double fonstSize = 14,
    Color color = black,
    FontWeight fontWeight = FontWeight.normal,
  }) =>
      TextStyle(
        fontFamily: "Righteous",
        fontSize: fonstSize,
        color: color,
        fontWeight: fontWeight,
      );

  static TextStyle raviPrakashRegular({
    double fonstSize = 14,
    Color color = black,
    FontWeight fontWeight = FontWeight.normal,
  }) =>
      TextStyle(
        fontFamily: "RaviPrakash",
        fontSize: fonstSize,
        color: color,
        fontWeight: fontWeight,
      );

  static TextStyle robotoRegular({
    double fonstSize = 14,
    Color color = black,
    FontWeight fontWeight = FontWeight.normal,
  }) =>
      TextStyle(
        fontFamily: "Roboto",
        fontSize: fonstSize,
        color: color,
        fontWeight: fontWeight,
      );
}
