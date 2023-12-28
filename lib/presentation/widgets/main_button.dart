import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolda_app/presentation/styles/theme_wrapper.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    required this.onPressed,
    this.style,
    this.backgroundColor,
    this.child,
    this.text,
    super.key,
  }) : assert((child != null) ^ (text != null));

  final VoidCallback onPressed;
  final Widget? child;
  final String? text;
  final TextStyle? style;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (colors, fonts, icons, controller) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? colors.white,
            minimumSize: const Size.fromHeight(40),
            maximumSize: const Size.fromHeight(53),
            fixedSize: const Size.fromHeight(53),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          onPressed: onPressed,
          child: child ??
              Text(
                text!.toUpperCase(),
                style: style ??
                    fonts.righteousRegular.copyWith(
                      letterSpacing: 4,
                      color: colors.white,
                      fontSize: 20.sp,
                    ),
              ),
        );
      },
    );
  }
}
