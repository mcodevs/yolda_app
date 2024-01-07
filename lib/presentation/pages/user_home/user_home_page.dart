import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/application/home/user_home/bloc/user_home_bloc.dart';
import 'package:yolda_app/domain/common/extensions/list_extension.dart';
import 'package:yolda_app/domain/common/extensions/point_extension.dart';
import 'package:yolda_app/domain/common/extensions/position_extension.dart';
import 'package:yolda_app/infrastructure/firebase/firebase_service.dart';
import 'package:yolda_app/infrastructure/firebase/home_firebase_widget.dart';
import 'package:yolda_app/infrastructure/models/home/radars/speed_radar.dart';
import 'package:yolda_app/infrastructure/services/log_service.dart';
import 'package:yolda_app/presentation/pages/user_home/widgets/compass_home_widget.dart';
import 'package:yolda_app/presentation/styles/theme_wrapper.dart';
import 'package:yolda_app/presentation/widgets/custom_fab.dart';
import 'package:yolda_app/presentation/widgets/custom_fab_location.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final Completer<YandexMapController> _controller = Completer();
  final GlobalKey mapKey = GlobalKey();
  late final UserHomeBloc _bloc;
  final ValueNotifier<bool> isUserDetected = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _bloc = UserHomeBloc();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  Future<void> onMapCreated(YandexMapController controller) async {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        floatingActionButtonLocation: CustomFABLocation(),
        floatingActionButton: HomeFABWidgets(
          controller: _controller,
          isUserDetected: isUserDetected,
        ),
        body: HomeFirebaseWidget(
          onLoading: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          onError: (context, errorMessage) {
            return Center(
              child: Text(errorMessage),
            );
          },
          onSuccess: (context, radars) {
            _bloc.add(UserHomeEvent.getAllMarkers(radars: radars));
            return ValueListenableBuilder(
              valueListenable: isUserDetected,
              builder: (context, value, child) {
                return StreamBuilder(
                  stream: Geolocator.getPositionStream(
                    locationSettings: AndroidSettings(
                      distanceFilter: 5,
                      intervalDuration: Duration.zero,
                      accuracy: LocationAccuracy.bestForNavigation,
                    ),
                  ),
                  builder: (context, snapshot) {
                    return CompassHomeWidget(
                      onLoading: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      onError: (context, errorMessage) {
                        return Center(
                          child: Text(errorMessage),
                        );
                      },
                      onSuccess: (context, heading) {
                        return YandexMap(
                          key: mapKey,
                          onMapCreated: onMapCreated,
                          mapObjects: value
                              ? [
                                  PlacemarkMapObject(
                                    mapId: const MapObjectId("user"),
                                    point: snapshot.data != null
                                        ? snapshot.data!.toPoint()
                                        : const Point(
                                            latitude: 0,
                                            longitude: 0,
                                          ),
                                    direction: heading,
                                    opacity: 0.9,
                                    icon: PlacemarkIcon.single(
                                      PlacemarkIconStyle(
                                        image:
                                            BitmapDescriptor.fromAssetImage(
                                          "assets/icons/navigator.png",
                                        ),
                                        isFlat: true,
                                        rotationType: RotationType.rotate,
                                      ),
                                    ),
                                  )
                                ]
                              : [],
                          onMapTap: (argument) {
                            final radar = SpeedRadar(
                              name: "test",
                              location: argument.toLocation(),
                              speedLimit: 70,
                            );
                            _bloc.add(
                              UserHomeEvent.createMarker(radar: radar),
                            );
                          },
                        );
                      },
                      onAccuracyLow: () {
                        LogService.e("compas yaxshi ishlamayapti");
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class HomeFABWidgets extends StatelessWidget {
  const HomeFABWidgets({
    super.key,
    required Completer<YandexMapController> controller,
    required this.isUserDetected,
  }) : _controller = controller;

  final Completer<YandexMapController> _controller;
  final ValueNotifier<bool> isUserDetected;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (colors, fonts, icons, controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomFAB(
              radius: 15,
              onPressed: () {},
              child: Icon(
                Icons.settings,
                color: colors.white,
                size: 35.r,
              ),
            ),
            CustomFAB(
              child: Icon(
                Icons.add,
                color: colors.white,
                size: 35.r,
              ),
              onPressed: () {},
            ),
            CustomFAB(
              child: Icon(
                Icons.gps_fixed,
                color: colors.white,
                size: 30.r,
              ),
              onPressed: () async {
                final position = await Geolocator.getLastKnownPosition() ??
                    await Geolocator.getCurrentPosition();
                final controller = await _controller.future;
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
                isUserDetected.value = true;
              },
            ),
          ],
        );
      },
    );
  }
}
