import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yolda_app/infrastructure/implementations/auth/auth_service.dart';
import 'package:yolda_app/presentation/app_widget.dart';
import 'package:yolda_app/presentation/styles/theme.dart';

class AppScope extends StatelessWidget {
  const AppScope({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale("uz"),
      ],
      path: "assets/translations",
      fallbackLocale: const Locale("uz"),
      useOnlyLangCode: true,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => CustomTheme.create(),
              ),
              RepositoryProvider(
                create: (context) => AuthServiceImpl(),
              ),
            ],
            builder: (context, child) => const AppWidget(),
          );
        },
      ),
    );
  }
}
