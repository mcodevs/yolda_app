import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/infrastructure/models/home/enums/radar_type.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator_converter.dart';
import 'package:yolda_app/infrastructure/models/home/radars/back/back_radar.dart';
import 'package:yolda_app/infrastructure/models/home/radars/front/front_radar.dart';

abstract class BaseModel {
  final String name;
  @LocatorConverter()
  final Locator location;
  final List<int> radius;
  final String icon;
  final double degree;
  final RadarType type;

  const BaseModel({
    required this.name,
    required this.location,
    required this.radius,
    required this.icon,
    required this.degree,
    required this.type,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    final type = $enumDecode(RadarType.radarTypes, json['type']);
    return switch (type) {
      RadarType.front => FrontRadar.fromJson(json),
      RadarType.back => BackRadar.fromJson(json),
      RadarType.twoSide => TwoSide.fromJson(json),
    };
  }

  Map<String, dynamic> toJson();

  BaseModel copyWith({
    Locator? location,
    double? degree,
    List<int>? radius,
  });
}
