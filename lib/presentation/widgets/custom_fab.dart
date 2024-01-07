import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolda_app/presentation/styles/theme_wrapper.dart';

class CustomFAB extends StatelessWidget {
  final double? radius;
  final Widget child;
  final VoidCallback onPressed;
  final double? size;
  final Color? color;
  final EdgeInsets padding;

  const CustomFAB({
    super.key,
    this.radius,
    required this.child,
    required this.onPressed,
    this.size,
    this.color,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (colors, fonts, icons, controller) {
      return SizedBox.square(
        dimension: size ?? 60.r,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 8,
            padding: padding,
            backgroundColor: color ?? colors.onPrimary,
            shape: radius != null
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(radius!)),
                  )
                : const CircleBorder(),
          ),
          onPressed: onPressed,
          child: child,
        ),
      );
    });
  }
}
