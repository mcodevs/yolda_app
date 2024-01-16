import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/domain/common/extensions/position_extension.dart';
import 'package:yolda_app/presentation/styles/theme_wrapper.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final Completer<YandexMapController> _completer = Completer();
  Future<void> onMapCreated(YandexMapController controller) async {
    _completer.complete(controller);
    final position = await Geolocator.getLastKnownPosition() ??
        await Geolocator.getCurrentPosition();

    await controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: position.toPoint(),
          azimuth: position.heading,
          tilt: 90,
          zoom: 17,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (colors, fonts, icons, controller) {
        return Scaffold(
          body: YandexMap(
            onMapCreated: onMapCreated,
          ),
        );
      },
    );
  }
}
