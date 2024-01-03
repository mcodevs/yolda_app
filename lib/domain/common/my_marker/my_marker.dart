import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/infrastructure/models/home/radar/radar.dart';

class MyMarker extends PlacemarkMapObject {
  final Radar radar;

  const MyMarker({
    required super.mapId,
    required super.point,
    super.zIndex,
    super.onDragStart,
    super.onDrag,
    super.onDragEnd,
    super.consumeTapEvents,
    super.isVisible,
    super.isDraggable,
    super.icon,
    super.opacity,
    super.direction,
    super.text,
    required this.radar,
  });

  static late void Function(MyMarker marker) onMarkerTapped;

  @override
  TapCallback<PlacemarkMapObject>? get onTap =>
      (mapObject, point) => onMarkerTapped(this);

  List<CircleMapObject> toCircles() {
    return [600, 300, 150, 50]
        .map(
          (e) => CircleMapObject(
            mapId: MapObjectId("$mapId-$e"),
            circle: Circle(center: point, radius: e.toDouble()),
            strokeWidth: 2,
            fillColor: Colors.transparent,
          ),
        )
        .toList();
  }
}
