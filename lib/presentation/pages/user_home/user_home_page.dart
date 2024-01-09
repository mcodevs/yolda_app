import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/application/home/user_home/bloc/user_home_bloc.dart';
import 'package:yolda_app/domain/common/extensions/point_extension.dart';
import 'package:yolda_app/domain/common/extensions/position_extension.dart';
import 'package:yolda_app/infrastructure/firebase/home_firebase_widget.dart';
import 'package:yolda_app/infrastructure/implementations/auth/auth_service.dart';
import 'package:yolda_app/infrastructure/models/home/radars/speed_radar.dart';
import 'package:yolda_app/infrastructure/services/log_service.dart';
import 'package:yolda_app/presentation/pages/user_home/widgets/compass_home_widget.dart';
import 'package:yolda_app/presentation/pages/user_home/widgets/position_home_widget.dart';
import 'package:yolda_app/presentation/styles/theme_wrapper.dart';
import 'package:yolda_app/presentation/widgets/custom_fab.dart';
import 'package:yolda_app/presentation/widgets/custom_fab_location.dart';

import '../../../domain/common/enums/location_state.dart';
import '../../routes/routes.dart';

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
  final ValueNotifier<LocationState> locationState =
      ValueNotifier(LocationState.notFixed);

  @override
  void initState() {
    super.initState();
    _bloc = UserHomeBloc()
      ..add(
        const UserHomeEvent.initial(),
      );
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
      child: ThemeWrapper(builder: (colors, fonts, icons, controller) {
        return Scaffold(
          floatingActionButtonLocation: CustomFABLocation(),
          floatingActionButton: HomeFABWidgets(
            locationState: locationState,
            controller: _controller,
            isUserDetected: isUserDetected,
          ),
          body: Stack(
            children: [
              HomeFirebaseWidget(
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
                                onCameraPositionChanged:
                                    (cameraPosition, reason, finished) {
                                  if (!finished &&
                                      reason == CameraUpdateReason.gestures) {
                                    locationState.value =
                                        LocationState.notFixed;
                                  }
                                },
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
                                              image: BitmapDescriptor
                                                  .fromAssetImage(
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
              Positioned(
                top: 160,
                left: 12,
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 75,
                    width: 85,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PositionHomeWidget(
                            onError: (context, message) {
                              return Center(
                                child: Text(message),
                              );
                            },
                            onLoading: (context) {
                              return const Text(
                                "0",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              );
                            },
                            onSuccess: (context, value) {
                              return Text(
                                value.toString(),
                                style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              );
                            },
                            selector: (position) {
                              return (position.speed * 3.6).toInt();
                            },
                          ),
                          const Text(
                            "km/s",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 250,
                left: 15,
                child: Limit(
                  speed: "100",
                  onPressed: () {},
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class Limit extends StatelessWidget {
  final String speed;
  final double? dimension;
  final VoidCallback onPressed;
  final double? fontSize;

  const Limit({
    super.key,
    required this.speed,
    required this.onPressed,
    this.dimension,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox.square(
        dimension: dimension ?? 80.r,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(
              Radius.circular(200),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Center(
                  child: Text(
                    speed,
                    style: TextStyle(
                      fontSize: fontSize ?? 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeFABWidgets extends StatefulWidget {
  const HomeFABWidgets({
    super.key,
    required Completer<YandexMapController> controller,
    required this.isUserDetected,
    required this.locationState,
  }) : _controller = controller;

  final Completer<YandexMapController> _controller;
  final ValueNotifier<LocationState> locationState;
  final ValueNotifier<bool> isUserDetected;

  @override
  State<HomeFABWidgets> createState() => _HomeFABWidgetsState();
}

class _HomeFABWidgetsState extends State<HomeFABWidgets> {
  StreamSubscription? streamSubscription;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (colors, fonts, icons, controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomFAB(
              radius: 15,
              onPressed: () async {
                await context.read<AuthServiceImpl>().logOut();
                if(mounted){
                  Navigator.pushAndRemoveUntil(
                    context,
                    Routes.getIntroPage(),
                    (route) => false,
                  );
                }
              },
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
              child: ValueListenableBuilder<LocationState>(
                valueListenable: widget.locationState,
                builder: (context, value, child) {
                  return Icon(
                    switch (value) {
                      LocationState.fixed => Icons.gps_fixed,
                      LocationState.notFixed => Icons.gps_not_fixed,
                      LocationState.tracked => Icons.navigation,
                    },
                    color: colors.white,
                    size: 30.r,
                  );
                },
              ),
              onPressed: () async {
                widget.locationState.value.map(
                  onFixed: () async {
                    if (streamSubscription == null) {
                      final navigationController =
                          await widget._controller.future;
                      streamSubscription = Geolocator.getPositionStream(
                        locationSettings: AndroidSettings(
                          accuracy: LocationAccuracy.bestForNavigation,
                          intervalDuration: Duration.zero,
                        ),
                      ).listen((event) async {
                        await navigationController.moveCamera(
                          animation: const MapAnimation(duration: 2),
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: event.toPoint(),
                              zoom: 18,
                              azimuth: event.heading,
                              tilt: 90,
                            ),
                          ),
                        );
                      });
                      widget.locationState.value = LocationState.tracked;
                    } else if (streamSubscription!.isPaused) {
                      streamSubscription!.resume();
                      widget.locationState.value = LocationState.tracked;
                    } else {
                      streamSubscription!.pause();
                      widget.locationState.value = LocationState.notFixed;
                    }
                  },
                  onNotFixed: () async {
                    final position = await Geolocator.getLastKnownPosition() ??
                        await Geolocator.getCurrentPosition();
                    final controller = await widget._controller.future;
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
                    widget.isUserDetected.value = true;
                    widget.locationState.value = LocationState.fixed;
                  },
                  onTracked: () {
                    streamSubscription!.pause();
                    widget.locationState.value = LocationState.notFixed;
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
