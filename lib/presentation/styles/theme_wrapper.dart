import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolda_app/presentation/styles/colors.dart';
import 'package:yolda_app/presentation/styles/fonts.dart';
import 'package:yolda_app/presentation/styles/icons.dart';
import 'package:yolda_app/presentation/styles/theme.dart';

class ThemeWrapper extends StatelessWidget {
  const ThemeWrapper({
    required this.builder,
    super.key,
  });
  final Widget Function(
    ColorSet colors,
    FontSet fonts,
    IconSet icons,
    CustomTheme controller,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomTheme>(
      builder: (context, theme, _) => builder(
        theme.colors,
        theme.fonts,
        theme.icons,
        theme,
      ),
    );
  }
}
