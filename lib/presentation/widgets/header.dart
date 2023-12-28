import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolda_app/presentation/styles/theme_wrapper.dart';

class Header extends StatelessWidget {
  const Header({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (colors, fonts, icons, controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text.toUpperCase(),
              style: fonts.righteousRegular.copyWith(
                letterSpacing: 4,
                color: colors.onPrimary,
                fontSize: 20.sp,
              ),
            ),
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints: BoxConstraints.expand(
                width: 218.w,
                height: 1,
              ),
              child: ColoredBox(
                color: colors.secondary,
              ),
            ),
          ],
        );
      },
    );
  }
}
