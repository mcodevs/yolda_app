import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:yolda_app/infrastructure/implementations/auth/auth_service.dart';
import 'package:yolda_app/infrastructure/services/db_service.dart';
import 'package:yolda_app/presentation/pages/auth/login/login_page.dart';
import 'package:yolda_app/presentation/pages/auth/register/confirm_page.dart';
import 'package:yolda_app/presentation/pages/auth/register/register_page.dart';
import 'package:yolda_app/presentation/pages/user_home/user_home_page.dart';
import 'package:yolda_app/presentation/pages/intro/intro_page.dart';

abstract final class Routes {
  const Routes._();
  static PageRoute getInitialRoute(BuildContext context) {
    final service = context.read<AuthServiceImpl>();
    if (service.role != null) {
      return getHomePage();
    } else {
      return getIntroPage();
    }
  }

  static Future<void> checkAndPushHome(BuildContext context) async {
    final permissions = await [
      Permission.location,
      Permission.activityRecognition,
    ].request();
    if (permissions.values
        .every((element) => element == PermissionStatus.granted)) {
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          getHomePage(),
          (route) => false,
        );
      }
    }
  }

  static PageRoute getHomePage() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );

  static PageRoute getIntroPage() => MaterialPageRoute(
        builder: (context) => const IntroPage(),
      );

  static PageRoute noConnectionPage() => MaterialPageRoute(
        builder: (context) => const Placeholder(),
      );

  static PageRoute getLoginPage() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );

  static PageRoute getRegisterPage() => MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      );

  static PageRoute getConfirmPage() => MaterialPageRoute(
        builder: (context) => const ConfirmPage(),
      );
}
