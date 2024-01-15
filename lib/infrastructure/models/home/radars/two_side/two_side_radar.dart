import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yolda_app/infrastructure/constants/app_icons.dart';
import 'package:yolda_app/infrastructure/models/home/base/base_model.dart';
import 'package:yolda_app/infrastructure/models/home/enums/radar_type.dart';

import '../../locator/locator.dart';
import '../../locator/locator_converter.dart';

part 'two_side_radar.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class TwoSideRadar extends BaseModel {
  final int speedLimit;

  TwoSideRadar({
    required super.location,
    required super.degree,
    required this.speedLimit,
    String? icon,
    String? name,
    RadarType? type,
    List<int>? radius,
  }) : super(
          icon: icon ?? AppIcons.camera3,
          name: name ?? "Ikki tomonlama radar",
          type: type ?? RadarType.twoSide,
          radius: radius ?? [600, 300, 150, 50],
        );

  @override
  BaseModel copyWith({
    Locator? location,
    double? degree,
    List<int>? radius,
    int? speedLimit,
  }) {
    return TwoSideRadar(
      location: location ?? this.location,
      degree: degree ?? this.degree,
      speedLimit: speedLimit ?? this.speedLimit,
      radius: radius ?? this.radius,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$TwoSideRadarToJson(this);

  factory TwoSideRadar.fromJson(Map<String, dynamic> json) =>
      _$TwoSideRadarFromJson(json);
}
