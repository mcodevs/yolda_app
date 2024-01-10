import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yolda_app/domain/common/enums/role.dart';
import 'package:yolda_app/presentation/pages/admin_home.dart/admin_home_page.dart';
import 'package:yolda_app/presentation/pages/auth/login/login_page.dart';
import 'package:yolda_app/presentation/pages/auth/register/confirm_page.dart';
import 'package:yolda_app/presentation/pages/auth/register/register_page.dart';
import 'package:yolda_app/presentation/pages/radar_admin_home/radar_admin_home_page.dart';
import 'package:yolda_app/presentation/pages/user_home/user_home_page.dart';
import 'package:yolda_app/presentation/pages/intro/intro_page.dart';

abstract final class Routes {
  const Routes._();

  static PageRoute getInitialRoute(Role? role) {
    return switch (role) {
      Role.radarAdmin => getRadarAdminPage(),
      Role.user => getHomePage(),
      _ => getIntroPage(),
    };
  }

  static Future<void> checkAndPushHome(BuildContext context) async {
    final permissions = await [
      Permission.location,
      Permission.activityRecognition,
    ].request();
    if (permissions.values
        .every((element) => element == PermissionStatus.granted)) {
      await Geolocator.getCurrentPosition();
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
        builder: (context) => const UserHomePage(),
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

  static PageRoute getConfirmPage({
    required String name,
    required String phoneNumber,
    required String carNumber,
  }) =>
      MaterialPageRoute(
        builder: (context) => ConfirmPage(
          name: name,
          phoneNumber: phoneNumber,
          carNumber: carNumber,
        ),
      );

  static PageRoute getAdminHomePage() {
    return MaterialPageRoute(
      builder: (context) => const AdminHomePage(),
    );
  }

  static PageRoute getRadarAdminPage() {
    return MaterialPageRoute(
      builder: (context) => const RadarAdminHomePage(),
    );
  }
}
