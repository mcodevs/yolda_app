import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/domain/common/extensions/point_extension.dart';
import 'package:yolda_app/domain/common/extensions/position_extension.dart';
import 'package:yolda_app/infrastructure/models/home/enums/radar_type.dart';
import 'package:yolda_app/infrastructure/models/home/radars/multiradar/multiradar.dart';
import 'package:yolda_app/infrastructure/models/home/radars/pillar/pillar.dart';
import 'package:yolda_app/infrastructure/models/home/radars/post/post.dart';
import 'package:yolda_app/infrastructure/models/home/radars/three_legged/three_legged.dart';
import 'package:yolda_app/presentation/pages/admin_home.dart/controllers/bloc/add_object_bloc.dart';
import 'package:yolda_app/presentation/styles/theme_wrapper.dart';
import 'package:yolda_app/presentation/widgets/custom_fab.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  /// Fields
  final Completer<YandexMapController> _completer = Completer();
  late final AddObjectBloc addObjectBloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  PersistentBottomSheetController? _bottomSheetController;
  ValueNotifier<bool> isBottomOpened = ValueNotifier(false);
  final ValueNotifier<RadarType?> currentRadarType = ValueNotifier(null);

  @override
  void initState() {
    addObjectBloc = AddObjectBloc();
    super.initState();
  }

  @override
  void dispose() {
    addObjectBloc.close();
    super.dispose();
  }

  /// Methods
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

  Future<void> onMapTap(BuildContext context, Point point) async {
    final controller = await _completer.future;

    await controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: point,
          zoom: 17,
        ),
      ),
      animation: const MapAnimation(),
    );

    addObjectBloc.add(const AddObjectEvent.waitForAdd());

    if (!mounted) return;

    if (isBottomOpened.value) return;
    isBottomOpened.value = true;
    _bottomSheetController = _scaffoldKey.currentState!.showBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      constraints: const BoxConstraints(
        maxHeight: 350,
      ),
      (context) => BottomSheet(
        elevation: 0,
        backgroundColor: Colors.transparent,
        onClosing: () {},
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                  valueListenable: currentRadarType,
                  builder: (context, currentRadar, child) {
                    return DropdownButton(
                      items: RadarType.values
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.radarName),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        currentRadarType.value = value;
                        final baseModel = switch (value!) {
                          RadarType.multiRadar => MultiRadar(
                              location: point.toLocator(),
                              degree: 0,
                              speedLimit: 0,
                            ),
                          RadarType.pillar => Pillar(
                              location: point.toLocator(),
                              degree: 0,
                              speedLimit: 0,
                            ),
                          RadarType.post => Post(
                              location: point.toLocator(),
                              degree: 0,
                            ),
                          RadarType.threeLegged => ThreeLegged(
                              location: point.toLocator(),
                              degree: 0,
                              speedLimit: 0,
                            ),
                        };
                        addObjectBloc.add(
                          AddObjectEvent.changeObjectType(baseModel),
                        );
                      },
                      value: currentRadar,
                    );
                  }),
              IconButton(
                onPressed: () {
                  isBottomOpened.value = false;
                  currentRadarType.value = null;
                  addObjectBloc.add(const AddObjectEvent.exit());
                  _bottomSheetController?.close();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> onMapCreated(YandexMapController controller) async {
    _completer.complete(controller);
    await getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: addObjectBloc,
      child: ThemeWrapper(
        builder: (colors, fonts, icons, controller) {
          return Scaffold(
            key: _scaffoldKey,
            body: Stack(
              children: [
                Positioned.fill(
                  child: ValueListenableBuilder(
                    valueListenable: isBottomOpened,
                    builder: (context, isOpened, child) {
                      return YandexMap(
                        onMapTap: (argument) => onMapTap(context, argument),
                        onMapCreated: onMapCreated,
                        rotateGesturesEnabled: !isOpened,
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 24,
                  left: 0,
                  right: 0,
                  child: Row(
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
                ),
                Positioned.fill(
                  child: BlocBuilder<AddObjectBloc, AddObjectState>(
                    bloc: addObjectBloc,
                    builder: (context, state) => state.map(
                      initial: (value) => const Center(
                        child: Icon(Icons.add),
                      ),
                      objectChanged: (value) {
                        return Center(
                          child: Image(
                            image: AssetImage(value.object.icon),
                            height: 30,
                            fit: BoxFit.fitHeight,
                          ),
                        );
                      },
                      focusRemoved: (value) => const SizedBox.shrink(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
