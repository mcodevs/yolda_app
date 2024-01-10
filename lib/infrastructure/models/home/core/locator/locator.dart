import 'package:json_annotation/json_annotation.dart';

part 'locator.g.dart';

@JsonSerializable()
class Locator {
  final double latitude;
  final double longitude;

  Locator({
    required this.latitude,
    required this.longitude,
  });

  factory Locator.fromJson(Map<String, dynamic> json) =>
      _$LocatorFromJson(json);

  Map<String, dynamic> toJson() => _$LocatorToJson(this);
}
