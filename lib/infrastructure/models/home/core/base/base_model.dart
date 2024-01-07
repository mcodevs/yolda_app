import 'package:geofence_service/geofence_service.dart' hide Location;
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/infrastructure/models/home/core/location/location.dart';
import 'package:yolda_app/infrastructure/models/home/core/location/location_converter.dart';
import 'package:yolda_app/infrastructure/models/home/core/marker_type.dart';
import 'package:yolda_app/infrastructure/models/home/radars/speed_radar.dart';

abstract class BaseModel {
  final String id;
  final String name;
  final MarkerType type;
  @LocationConverter()
  final Location location;

  static const uuid = Uuid();
  static const _$MarkerTypeEnumMap = {
    MarkerType.speed: 'speed',
    MarkerType.speedRadar: 'speed-radar',
    MarkerType.beltRadar: 'belt-radar',
    MarkerType.trafficRadar: 'traffic-radar',
    MarkerType.carWash: 'car-wash',
    MarkerType.fuelStation: 'fuel-station',
    MarkerType.autoParts: 'auto-parts',
    MarkerType.carRepair: 'car-repair',
  };

  BaseModel({
    String? id,
    required this.name,
    required this.type,
    required this.location,
  }) : id = id ?? uuid.v4();

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      switch ($enumDecode(_$MarkerTypeEnumMap, json['type'])) {
        MarkerType.speed => SpeedRadar.fromJson(json), // Speed.fromJson(json),
        MarkerType.speedRadar => SpeedRadar.fromJson(json),
        MarkerType.beltRadar =>
          SpeedRadar.fromJson(json), // BeltRadar.fromJson(json),
        MarkerType.trafficRadar =>
          SpeedRadar.fromJson(json), // TrafficRadar.fromJson(json),
        MarkerType.carWash =>
          SpeedRadar.fromJson(json), // CarWash.fromJson(json),
        MarkerType.fuelStation =>
          SpeedRadar.fromJson(json), // FuelStation.fromJson(json),
        MarkerType.autoParts =>
          SpeedRadar.fromJson(json), // AutoParts.fromJson(json),
        MarkerType.carRepair =>
          SpeedRadar.fromJson(json), // CarRepair.fromJson(json),
      };

  Map<String, dynamic> toJson();

  BaseModel copyWith({
    String? name,
    MarkerType? type,
    Location? location,
  });

  PlacemarkMapObject toMarker();
  Geofence toGeofence();

  @override
  String toString() {
    return 'BaseModel(id: $id, name: $name, type: $type, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseModel &&
        other.id == id &&
        other.name == name &&
        other.type == type &&
        other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ type.hashCode ^ location.hashCode;
  }
}
