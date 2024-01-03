import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/infrastructure/models/home/radar/radar.dart';

part 'only_limit.g.dart';

@JsonSerializable()
class OnlyLimit extends Radar {
  const OnlyLimit({
    required super.id,
    required super.territory,
    RadarType? type,
    required super.speedLimit,
    required super.location,
  }) : super(type: type ?? RadarType.onlyLimit);

  @override
  OnlyLimit copyWith({
    String? territory,
    RadarType? type,
    int? speedLimit,
    Point? location,
  }) {
    return OnlyLimit(
      id: id,
      territory: territory ?? this.territory,
      type: type ?? this.type,
      speedLimit: speedLimit ?? this.speedLimit,
      location: location ?? this.location,
    );
  }

  factory OnlyLimit.fromJson(Map<String, Object?> json) =>
      _$OnlyLimitFromJson(json);

  @override
  Map<String, Object?> toJson() => _$OnlyLimitToJson(this);
}
