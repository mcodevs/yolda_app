import 'package:yolda_app/infrastructure/models/home/enums/radar_type.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator_converter.dart';

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

  Map<String, dynamic> toJson();

  BaseModel copyWith({
    Locator? location,
    double? degree,
    List<int>? radius,
  });
}
