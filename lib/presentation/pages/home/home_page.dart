import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/application/home/bloc/marker_bloc.dart';
import 'package:yolda_app/domain/common/enums/location_state.dart';
import 'package:yolda_app/domain/common/extensions/position_extension.dart';
import 'package:yolda_app/infrastructure/implementations/radar_service/fake_radar_service.dart';
import 'package:yolda_app/infrastructure/models/home/radar/radar.dart';
import 'package:yolda_app/infrastructure/services/log_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Yandex Map Controller
  final Completer<YandexMapController> _controller = Completer();

  /// Subscription for speed
  StreamSubscription? speedSubscription;

  /// Sunscription for camera
  StreamSubscription? cameraSubscription;

  /// Variable for speed changes
  final ValueNotifier<int> speed = ValueNotifier(0);

  /// Current location state
  final ValueNotifier<LocationState> locationState =
      ValueNotifier(LocationState.notFixed);

  /// Bloc
  late final MarkerBloc _bloc;

  /// Callback when map created
  void onMapCreated(YandexMapController controller) async {
    // Complete the future
    _controller.complete(controller);

    await controller.toggleTrafficLayer(
      visible: true,
    );

    // Assign subscription value
    speedSubscription = Geolocator.getPositionStream(
      locationSettings: AndroidSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 1,
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationTitle: "Joylashuv xizmati yoniq",
          notificationText: "Ilovaga kirish uchun bosing",
        ),
        intervalDuration: Duration.zero,
      ),
    ).listen((event) {
      final speedValue = (event.speed * 3.6).toInt();
      speed.value = speedValue;
    });

    cameraSubscription = Geolocator.getPositionStream(
      locationSettings: AndroidSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 1,
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationTitle: "Joylashuv xizmati yoniq",
          notificationText: "Ilovaga kirish uchun bosing",
        ),
        intervalDuration: Duration.zero,
      ),
    ).listen((event) async {
      await controller.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: event.toPoint(),
            tilt: 90,
            azimuth: event.heading,
            zoom: 17,
          ),
        ),
        animation: const MapAnimation(duration: 1),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _bloc = MarkerBloc(repository: FakeRadarService())
      ..add(
        const MarkerEvent.getAllMarkers(),
      );
  }

  @override
  void dispose() async {
    (await _controller.future).dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: BlocBuilder<MarkerBloc, MarkerState>(
                builder: (context, state) {
                  return StreamBuilder<Position>(
                    stream: Geolocator.getPositionStream(
                      locationSettings: AndroidSettings(
                        accuracy: LocationAccuracy.bestForNavigation,
                        intervalDuration: Duration.zero,
                        distanceFilter: 1,
                      ),
                    ),
                    builder: (context, posSnapshot) {
                      if (posSnapshot.hasError) {
                        LogService.e(posSnapshot.error.toString());
                      }
                      return StreamBuilder<CompassEvent>(
                        stream: FlutterCompass.events,
                        builder: (context, snapshot) {
                          return YandexMap(
                            onMapTap: (argument) {
                              final radar = Radar.limitAndRadar(
                                id: const Uuid().v4(),
                                territory: "1",
                                type: RadarType.limitAndRadar,
                                location: argument,
                                speedLimit: 70,
                                data: "Salom",
                                directionType: "1",
                              );
                              _bloc.add(MarkerEvent.createMarker(radar: radar));
                            },
                            mapObjects: state
                                .maybeMap<List<PlacemarkMapObject>>(
                              orElse: () => [],
                              success: (value) => value.markers
                                  .cast<PlacemarkMapObject>()
                                  .toList(),
                            )..add(
                                PlacemarkMapObject(
                                  mapId: const MapObjectId("user"),
                                  point: posSnapshot.data != null
                                      ? posSnapshot.data!.toPoint()
                                      : const Point(latitude: 0, longitude: 0),
                                  icon: PlacemarkIcon.single(
                                    PlacemarkIconStyle(
                                      image: BitmapDescriptor.fromAssetImage(
                                          "assets/icons/navigator.png"),
                                      rotationType: RotationType.rotate,
                                      isFlat: true,
                                    ),
                                  ),
                                  opacity: 0.8,
                                  direction: snapshot.data != null
                                      ? (snapshot.data!.heading!.isNegative
                                          ? 360 + snapshot.data!.heading!
                                          : snapshot.data!.heading!)
                                      : 0,
                                ),
                              ),
                            onMapCreated: onMapCreated,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
