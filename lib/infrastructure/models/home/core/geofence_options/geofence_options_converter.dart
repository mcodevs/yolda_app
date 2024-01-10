import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/infrastructure/models/home/core/geofence_options/geofence_options.dart';

class GeofenceOptionsConverter
    extends JsonConverter<GeofenceOptions, Map<String, dynamic>> {
  const GeofenceOptionsConverter();

  @override
  GeofenceOptions fromJson(Map<String, dynamic> json) =>
      GeofenceOptions.fromJson(json);

  @override
  Map<String, dynamic> toJson(GeofenceOptions object) => object.toJson();
}
