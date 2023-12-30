import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yolda_app/infrastructure/models/home/radar/radar.dart';

class MyMarker extends Marker {
  final Radar radar;

  const MyMarker({
    required super.markerId,
    required super.position,
    required this.radar,
  });

  static late final void Function(MyMarker radar) onMarkerTapped;

  static late BitmapDescriptor markerIcon;

  static void setIcon(BitmapDescriptor icon) => markerIcon = icon;

  List<Circle> toCircles() {
    return [600, 300, 150, 50]
        .map(
          (e) => Circle(
            circleId: CircleId("$markerId-$e"),
            center: position,
            radius: e.toDouble(),
            strokeWidth: 2,
          ),
        )
        .toList();
  }

  @override
  VoidCallback? get onTap => () => onMarkerTapped(this);

  @override
  BitmapDescriptor get icon => markerIcon;
}
