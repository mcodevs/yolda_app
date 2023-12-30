
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:yolda_app/infrastructure/models/home/limit_and_radar/limit_and_radar.dart';
import 'package:yolda_app/infrastructure/models/home/my_marker/my_marker.dart';
import 'package:yolda_app/infrastructure/models/home/only_limit/only_limit.dart';

enum RadarType {
  @JsonValue("only-limit")
  onlyLimit,
  @JsonValue("limit-and-radar")
  limitAndRadar;

  static RadarType fromString(String type) {
    return switch (type) {
      "only-limit" => RadarType.onlyLimit,
      "limit-and-radar" => RadarType.limitAndRadar,
      _ => RadarType.onlyLimit,
    };
  }
}

@JsonSerializable()
abstract class Radar with _RadarModelPatternMatcher {
  final String id;
  final String territory;
  final RadarType type;
  @JsonKey(name: "speed_limit")
  final int speedLimit;
  @LatLngJsonConverter()
  final LatLng location;

  const Radar({
    required this.id,
    required this.territory,
    required this.type,
    required this.speedLimit,
    required this.location,
  });

  Radar copyWith({
    String? territory,
    int? speedLimit,
    LatLng? location,
  });

  MyMarker toMarker() => MyMarker(
        markerId: MarkerId(id),
        position: location,
        radar: this,
      );

  Geofence toGeofence() => Geofence(
        id: id,
        data: this,
        latitude: location.latitude,
        longitude: location.longitude,
        radius: [
          GeofenceRadius(id: "600", length: 600),
          GeofenceRadius(id: "300", length: 300),
          GeofenceRadius(id: "150", length: 150),
          GeofenceRadius(id: "50", length: 50),
        ],
      );

  const factory Radar.onlyLimit({
    required String id,
    required String territory,
    required RadarType type,
    required int speedLimit,
    required LatLng location,
  }) = OnlyLimit;

  const factory Radar.limitAndRadar({
    required String id,
    required String territory,
    required RadarType type,
    required int speedLimit,
    required LatLng location,
    required String data,
    required String directionType,
  }) = LimitAndRadar;

  factory Radar.fromJson(Map<String, Object?> json) {
    return switch (RadarType.fromString(json['type'] as String)) {
      RadarType.limitAndRadar => LimitAndRadar.fromJson(json),
      RadarType.onlyLimit => OnlyLimit.fromJson(json),
    };
  }

  Map<String, Object?> toJson();

  @override
  T map<T>({
    required T Function(OnlyLimit value) onOnlyLimit,
    required T Function(LimitAndRadar value) onLimitAndRadar,
  }) =>
      switch (this) {
        OnlyLimit e => onOnlyLimit(e),
        LimitAndRadar e => onLimitAndRadar(e),
        Radar() => throw UnimplementedError(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Radar && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class LatLngJsonConverter extends JsonConverter<LatLng, List> {
  const LatLngJsonConverter();

  @override
  LatLng fromJson(List json) {
    return LatLng(json[0] as double, json[1] as double);
  }

  @override
  List toJson(LatLng object) {
    return [object.latitude, object.longitude];
  }
}

mixin _RadarModelPatternMatcher {
  T map<T>({
    required T Function(OnlyLimit value) onOnlyLimit,
    required T Function(LimitAndRadar value) onLimitAndRadar,
  });
}

