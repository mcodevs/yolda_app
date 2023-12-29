import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yolda_app/infrastructure/models/home/limit_and_radar/limit_and_radar.dart';
import 'package:yolda_app/infrastructure/models/home/only_limit/only_limit.dart';

part 'radar.g.dart';

@JsonSerializable()
class Radar with _RadarModelPatternMatcher {
  final String id;
  @JsonKey(name: "speed_limit")
  final int speedLimit;
  @LatLngJsonConverter()
  final LatLng location;

  const Radar({
    required this.id,
    required this.speedLimit,
    required this.location,
  });

  const factory Radar.onlyLimit({
    required String id,
    required int speedLimit,
    required LatLng location,
  }) = OnlyLimit;

  const factory Radar.limitAndRadar({
    required String id,
    required int speedLimit,
    required LatLng location,
    required String data,
    required String type,
  }) = LimitAndRadar;

  factory Radar.fromJson(Map<String, Object?> json) => _$RadarFromJson(json);

  Map<String, Object?> toJson() => _$RadarToJson(this);

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
}

class LatLngJsonConverter extends JsonConverter<LatLng, List<double>> {
  const LatLngJsonConverter();

  @override
  LatLng fromJson(List<double> json) {
    return LatLng.fromJson(json)!;
  }

  @override
  List<double> toJson(LatLng object) {
    return (object.toJson() as List).cast<double>();
  }
}

mixin _RadarModelPatternMatcher {
  T map<T>({
    required T Function(OnlyLimit value) onOnlyLimit,
    required T Function(LimitAndRadar value) onLimitAndRadar,
  });
}
