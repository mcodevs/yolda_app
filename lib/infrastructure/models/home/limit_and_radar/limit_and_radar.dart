import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yolda_app/infrastructure/models/home/radar/radar.dart';

part 'limit_and_radar.g.dart';

@JsonSerializable()
class LimitAndRadar extends Radar {
  final String directionType;
  final String data;

  const LimitAndRadar({
    required super.id,
    required super.territory,
    RadarType? type,
    required super.speedLimit,
    required super.location,
    required this.directionType,
    required this.data,
  }) : super(type: type ?? RadarType.limitAndRadar);

  @override
  LimitAndRadar copyWith({
    String? territory,
    RadarType? type,
    int? speedLimit,
    LatLng? location,
    String? directionType,
    String? data,
  }) {
    return LimitAndRadar(
      id: id,
      territory: territory ?? this.territory,
      type: type ?? this.type,
      speedLimit: speedLimit ?? this.speedLimit,
      location: location ?? this.location,
      directionType: directionType ?? this.directionType,
      data: data ?? this.data,
    );
  }

  factory LimitAndRadar.fromJson(Map<String, Object?> json) =>
      _$LimitAndRadarFromJson(json);

  @override
  Map<String, Object?> toJson() => _$LimitAndRadarToJson(this);
}
