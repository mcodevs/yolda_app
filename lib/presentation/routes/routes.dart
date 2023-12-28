import 'package:flutter/material.dart';
import 'package:yolda_app/infrastructure/services/connectivity.dart';
import 'package:yolda_app/infrastructure/services/db_service.dart';
import 'package:yolda_app/presentation/pages/auth/login/login_page.dart';
import 'package:yolda_app/presentation/pages/auth/register/confirm_page.dart';
import 'package:yolda_app/presentation/pages/auth/register/register_page.dart';
import 'package:yolda_app/presentation/pages/home/home_page.dart';
import 'package:yolda_app/presentation/pages/intro/intro_page.dart';

abstract final class Routes {
  const Routes._();
  static PageRoute getInitialRoute() {
    if (DBService.isLogged) {
      return getHomePage();
    } else {
      if (ConnectivityService.hasConnection) {
        return getIntroPage();
      } else {
        return noConnectionPage();
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
        builder: (context) => const IntroPage(),
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
