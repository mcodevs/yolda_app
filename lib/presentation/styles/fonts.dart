import 'package:flutter/material.dart';
import 'package:yolda_app/presentation/styles/style.dart';

class FontSet {
  final TextStyle righteousRegular;

  const FontSet._({
    required this.righteousRegular,
  });

  factory FontSet.createLight() {
    return FontSet._(
      righteousRegular: Style.righteousRegular(fonstSize: 20),
    );
  }
}
