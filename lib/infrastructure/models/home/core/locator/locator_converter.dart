import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/infrastructure/models/home/core/locator/locator.dart';

class LocatorConverter extends JsonConverter<Locator, Map<String, dynamic>> {
  
  const LocatorConverter();

  @override
  Locator fromJson(Map<String, dynamic> json) => Locator.fromJson(json);

  @override
  Map<String, dynamic> toJson(Locator object) => object.toJson();
}
