import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yolda_app/infrastructure/models/home/radar/radar.dart';

part 'limit_and_radar.g.dart';

@JsonSerializable()
class LimitAndRadar extends Radar {
  final String type;
  final String data;

  const LimitAndRadar({
    required super.id,
    required super.speedLimit,
    required super.location,
    required this.type,
    required this.data,
  });

  factory LimitAndRadar.fromJson(Map<String, Object?> json) =>
      _$LimitAndRadarFromJson(json);

  @override
  Map<String, Object?> toJson() => _$LimitAndRadarToJson(this);
}
