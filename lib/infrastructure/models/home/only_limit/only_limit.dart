import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yolda_app/infrastructure/models/home/radar/radar.dart';

part 'only_limit.g.dart';

@JsonSerializable()
class OnlyLimit extends Radar {
  const OnlyLimit({
    required super.id,
    required super.speedLimit,
    required super.location,
  });

  factory OnlyLimit.fromJson(Map<String, Object?> json) =>
      _$OnlyLimitFromJson(json);

  @override
  Map<String, Object?> toJson() => _$OnlyLimitToJson(this);
}
