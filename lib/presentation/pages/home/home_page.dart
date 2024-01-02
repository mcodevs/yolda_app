import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:yolda_app/application/home/bloc/marker_bloc.dart';
import 'package:yolda_app/domain/common/extensions/set_extension.dart';
import 'package:yolda_app/infrastructure/implementations/radar_service/fake_radar_service.dart';
import 'package:yolda_app/infrastructure/models/home/only_limit/only_limit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller = Completer();
  StreamSubscription? subscription;
  final ValueNotifier<int> speed = ValueNotifier(0);
  late final MarkerBloc _bloc;
  bool isVisible = true;

  Future<void> getUserCameraPosition() async {
    final position = await Geolocator.getLastKnownPosition() ??
        await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation,
        );
    final controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 16,
          tilt: 90,
          bearing: position.heading,
        ),
      ),
    );
  }

  void speedChange() {
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
      ),
    ).listen((event) {
      speed.value = (event.speed * 3.6).round();
    });
  }

  void onMapCreated(controller) async {
    _controller.complete(controller);
    getUserCameraPosition();
    speedChange();
  }

  Future<void> listenLocationChange() async {
    final controller = await _controller.future;
    subscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
      ),
    ).listen(
      (event) {
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(event.latitude, event.longitude),
              zoom: 17,
              tilt: 90,
              bearing: event.heading,
            ),
          ),
        );
      },
    );
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () async {
                  if (subscription == null) {
                    await listenLocationChange();
                  } else if (subscription!.isPaused) {
                    subscription!.resume();
                  } else {
                    subscription!.pause();
                  }
                  setState(() {});
                },
                child: Icon(
                  subscription == null ||
                          (subscription != null && subscription!.isPaused)
                      ? Icons.gps_not_fixed
                      : Icons.gps_fixed,
                ),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: ValueListenableBuilder(
                  valueListenable: speed,
                  builder: (context, value, _) {
                    return Text("$value");
                  },
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Icon(
                  isVisible ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: BlocBuilder<MarkerBloc, MarkerState>(
                bloc: _bloc,
                builder: (context, state) {
                  return GoogleMap(
                    onTap: (argument) {
                      final radar = OnlyLimit(
                        id: const Uuid().v4(),
                        territory: "1",
                        speedLimit: Random().nextInt(80) + 20,
                        location: argument,
                      );
                      _bloc.add(MarkerEvent.createMarker(radar: radar));
                    },
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(41.31237, 69.159152),
                    ),
                    markers: state.maybeMap(
                      orElse: () => {},
                      success: (value) => value.markers,
                    ),
                    circles: state.maybeMap(
                      orElse: () => {},
                      success: (value) =>
                          isVisible ? value.markers.toCircles() : {},
                    ),
                    onMapCreated: onMapCreated,
                    myLocationButtonEnabled: false,
                    compassEnabled: false,
                    zoomControlsEnabled: false,
                    // myLocationEnabled: true,
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
