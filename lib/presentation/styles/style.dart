import 'package:flutter/material.dart';

class Style {
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

    

  static const black = Color(0xFF000000);
}
