import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller = Completer();

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
  void dispose() async {
    (await _controller.future).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              onTap: (argument) {

              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(41.31237, 69.159152),
              ),
              onMapCreated: onMapCreated,
              myLocationButtonEnabled: false,
              compassEnabled: false,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}
