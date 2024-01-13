import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/infrastructure/constants/app_icons.dart';
import 'package:yolda_app/infrastructure/models/home/base/base_model.dart';
import 'package:yolda_app/infrastructure/models/home/enums/radar_type.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator_converter.dart';

part 'front_radar.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class FrontRadar extends BaseModel {
  final int speedLimit;

  const FrontRadar({
    required super.location,
    required super.degree,
    required this.speedLimit,
    List<int>? radius,
  }) : super(
          icon: AppIcons.frontRadar,
          name: "Old tomon radari",
          type: RadarType.front,
          radius: radius ?? const [600, 300, 150, 50],
        );

  @override
  Map<String, dynamic> toJson() => _$FrontRadarToJson(this);

  factory FrontRadar.fromJson(Map<String, dynamic> json) =>
      _$FrontRadarFromJson(json);

  @override
  BaseModel copyWith({
    Locator? location,
    List<int>? radius,
    double? degree,
    int? speedLimit,
  }) {
    return FrontRadar(
      location: location ?? this.location,
      degree: degree ?? this.degree,
      speedLimit: speedLimit ?? this.speedLimit,
      radius: radius ?? this.radius,
    );
  }
}
