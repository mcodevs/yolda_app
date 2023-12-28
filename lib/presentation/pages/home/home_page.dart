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
              initialCameraPosition: const CameraPosition(
                target: LatLng(41.31237, 69.159152),
              ),
              onMapCreated: (controller) async {
                _controller.complete(controller);
                final position = await Geolocator.getLastKnownPosition() ??
                    await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.bestForNavigation,
                    );

                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(position.latitude, position.longitude),
                      zoom: 15,
                    ),
                  ),
                );
              },
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
