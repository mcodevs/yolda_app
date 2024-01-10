import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/infrastructure/models/home/core/parent/parent.dart';

class ParentConverter extends JsonConverter<Parent, Map<String, dynamic>> {
  const ParentConverter();
  @override
  Parent fromJson(Map<String, dynamic> json) => Parent.fromJson(json);

  @override
  Map<String, dynamic> toJson(Parent object) => object.toJson();
}
