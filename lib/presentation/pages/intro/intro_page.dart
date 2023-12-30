import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolda_app/presentation/pages/no_connection/connectivity_builder.dart';
import 'package:yolda_app/presentation/routes/routes.dart';
import 'package:yolda_app/presentation/styles/theme_wrapper.dart';
import 'package:yolda_app/presentation/widgets/main_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConnectivityBuilder(
      onConnected: (context) {
        return ThemeWrapper(
          builder: (colors, fonts, icons, controller) {
            return Scaffold(
              backgroundColor: colors.primary,
              body: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    children: [
                      138.verticalSpace,
                      Text(
                        "YO'LDA",
                        style: fonts.righteousRegular.copyWith(
                          color: colors.white,
                          letterSpacing: 5,
                          fontSize: 42.sp,
                        ),
                      ),
                      Text(
                        "XAFSIZ VA JARIMALARSIZ\nHARAKATLANING",
                        textAlign: TextAlign.center,
                        style: fonts.raviPrakashRegular.copyWith(
                          color: colors.white,
                          letterSpacing: 2,
                          fontSize: 16.sp,
                        ),
                      ),
                      25.verticalSpace,
                      Center(
                        child: Image(
                          image: AssetImage(icons.intro),
                          height: 216.r,
                          width: 216.r,
                        ),
                      ),
                      79.verticalSpace,
                      MainButton(
                        onPressed: () => Navigator.push(
                          context,
                          Routes.getLoginPage(),
                        ),
                        text: "Safarni boshlash",
                        style: fonts.righteousRegular.copyWith(
                          letterSpacing: 2,
                          fontSize: 16.sp,
                          color: colors.primary,
                        ),
                      ),
                      24.verticalSpace,
                      MainButton(
                        onPressed: () => Navigator.push(
                          context,
                          Routes.getRegisterPage(),
                        ),
                        text: "Ro'yhatdan o'tish",
                        backgroundColor: colors.secondary,
                        style: fonts.righteousRegular.copyWith(
                          letterSpacing: 4,
                          fontSize: 20.sp,
                          color: colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
