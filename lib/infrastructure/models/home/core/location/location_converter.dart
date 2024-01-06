import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/infrastructure/models/home/core/location/location.dart';

class LocationConverter extends JsonConverter<Location, Map<String, dynamic>> {
  const LocationConverter();

  @override
  Location fromJson(Map<String, dynamic> json) => Location.fromJson(json);

  @override
  Map<String, dynamic> toJson(Location object) => object.toJson();
}
