import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
    return ThemeWrapper(builder: (colors, fonts, icons, controller) {
      return MaterialApp(
        /// Localizations
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,

        /// Routes
        onGenerateRoute: (settings) => Routes.getInitialRoute(),

        /// App configs
        title: "Yo'lda",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: controller.mode,
      );
    });
  }
}
