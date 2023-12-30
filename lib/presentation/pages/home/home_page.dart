import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:yolda_app/application/home/bloc/marker_bloc.dart';
import 'package:yolda_app/infrastructure/api/fake_radar_service.dart';
import 'package:yolda_app/infrastructure/models/home/only_limit/only_limit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller = Completer();
  late final MarkerBloc _bloc;

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

  void onMapCreated(controller) async {
    _controller.complete(controller);
    getUserCameraPosition();
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
                    onMapCreated: onMapCreated,
                    myLocationButtonEnabled: false,
                    compassEnabled: false,
                    zoomControlsEnabled: false,
                    myLocationEnabled: true,
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
