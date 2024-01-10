import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/infrastructure/models/home/core/enums/detector_type.dart';
import 'package:yolda_app/infrastructure/models/home/core/enums/radar_type.dart';

part 'geofence_options.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class GeofenceOptions {
  final DetectorType? detectorType;
  final RadarType? radarType;
  final List<int>? radius;
  final bool isOpposite;
  final double? degree;
  final double? speedLimit;

  GeofenceOptions({
    required this.detectorType,
    required this.radarType,
    required this.radius,
    required this.isOpposite,
    required this.degree,
    required this.speedLimit,
  });

  GeofenceOptions copyWith({
    ValueGetter<DetectorType?>? detectorType,
    ValueGetter<RadarType?>? radarType,
    ValueGetter<List<int>?>? radius,
    bool? isOpposite,
    ValueGetter<double?>? degree,
    ValueGetter<double?>? speedLimit,
  }) {
    return GeofenceOptions(
      detectorType: detectorType?.call() ?? this.detectorType,
      radarType: radarType?.call() ?? this.radarType,
      radius: radius?.call() ?? this.radius,
      isOpposite: isOpposite ?? this.isOpposite,
      degree: degree?.call() ?? this.degree,
      speedLimit: speedLimit?.call() ?? this.speedLimit,
    );
  }

  factory GeofenceOptions.fromJson(Map<String, dynamic> json) =>
      _$GeofenceOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$GeofenceOptionsToJson(this);
}
