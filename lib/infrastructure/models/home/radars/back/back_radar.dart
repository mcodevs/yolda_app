import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/infrastructure/constants/app_icons.dart';
import 'package:yolda_app/infrastructure/models/home/base/base_model.dart';
import 'package:yolda_app/infrastructure/models/home/enums/radar_type.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator_converter.dart';

part 'back_radar.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab) // PaskalCase
class BackRadar extends BaseModel {
  final int speedLimit;

  BackRadar({
    required super.location,
    required super.degree,
    required this.speedLimit,
    String? icon,
    String? name,
    RadarType? type,
    List<int>? radius,
  }) : super(
          icon: icon ?? AppIcons.camera2,
          name: name ?? "Orqa tomon radari",
          type: type ?? RadarType.back,
          radius: radius ?? [600, 300, 150, 50],
        );

  @override
  BaseModel copyWith({
    Locator? location,
    double? degree,
    List<int>? radius,
    int? speedLimit,
  }) {
    return BackRadar(
      location: location ?? this.location,
      degree: degree ?? this.degree,
      speedLimit: speedLimit ?? this.speedLimit,
      radius: radius ?? this.radius,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$BackRadarToJson(this);

  factory BackRadar.fromJson(Map<String, dynamic> json) =>
      _$BackRadarFromJson(json);
}
