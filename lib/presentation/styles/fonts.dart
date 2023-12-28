import 'package:flutter/material.dart';
import 'package:yolda_app/presentation/styles/colors.dart';
import 'package:yolda_app/presentation/styles/style.dart';

class FontSet {
  final TextStyle righteousRegular;
  final TextStyle raviPrakashRegular;
  final TextStyle robotoRegular;

  const FontSet._({
    required this.righteousRegular,
    required this.raviPrakashRegular,
    required this.robotoRegular,
  });

  factory FontSet.create(ColorSet colors) {
    return FontSet._(
      righteousRegular: Style.righteousRegular(
        fonstSize: 20,
        color: colors.primaryTextColor,
      ),
      raviPrakashRegular: Style.raviPrakashRegular(
        fonstSize: 20,
        color: colors.primaryTextColor,
      ),
      robotoRegular: Style.robotoRegular(
        color: colors.primaryTextColor,
      ),
    );
  }
}
