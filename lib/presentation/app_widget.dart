import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:yolda_app/infrastructure/implementations/auth/auth_service.dart';
import 'package:yolda_app/presentation/routes/routes.dart';
import 'package:yolda_app/presentation/styles/theme_wrapper.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (colors, fonts, icons, controller) {
        return MaterialApp(
          /// Localizations
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,

          /// Routes
          onGenerateRoute: (settings) {
            return Routes.getInitialRoute(
              context.read<AuthServiceImpl>().role,
            );
          },

          /// Easy loading
          builder: EasyLoading.init(),

          /// App configs
          title: "Yo'lda",
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: controller.mode,
        );
      },
    );
  }
}
