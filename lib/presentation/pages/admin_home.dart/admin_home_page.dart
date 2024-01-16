import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/domain/common/extensions/position_extension.dart';
import 'package:yolda_app/infrastructure/implementations/auth/auth_service.dart';
import 'package:yolda_app/presentation/routes/routes.dart';
import 'package:yolda_app/presentation/styles/theme_wrapper.dart';
import 'package:yolda_app/presentation/widgets/custom_fab.dart';
import 'package:yolda_app/presentation/widgets/custom_fab_location.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final Completer<YandexMapController> _completer = Completer();

  Future<void> getUserLocation() async {
    final controller = await _completer.future;
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
      animation: const MapAnimation(),
    );
  }

  Future<void> onMapTap(Point point) async {

  }
  Future<void> onMapCreated(YandexMapController controller) async {
    _completer.complete(controller);
    await getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (colors, fonts, icons, controller) {
        return Scaffold(
          floatingActionButtonLocation: const CustomFABLocation(),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomFAB(
                child: Icon(
                  Icons.settings,
                  color: colors.white,
                  size: 35,
                ),
                onPressed: () {},
              ),
              CustomFAB(
                child: Icon(
                  Icons.add,
                  color: colors.white,
                  size: 40,
                ),
                onPressed: () {},
              ),
              CustomFAB(
                child: Icon(
                  Icons.gps_fixed,
                  color: colors.white,
                  size: 35,
                ),
                onPressed: () async {
                  await getUserLocation();
                },
              ),
            ],
          ),
          body: YandexMap(
            onMapTap: onMapTap,
            onMapCreated: onMapCreated,
          ),
        );
      },
    );
  }
}
