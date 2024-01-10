import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/infrastructure/models/home/core/enums/radar_or_place.dart';
import 'package:yolda_app/infrastructure/models/home/core/geofence_options/geofence_options.dart';

part 'parent.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class Parent {
  final String name;
  final String image;
  final GeofenceOptions? geofenceOptions;
  final RadarOrPlace type;

  Parent({
    required this.name,
    required this.image,
    required this.geofenceOptions,
    required this.type,
  });

  Parent copyWith({
    String? name,
    String? image,
    ValueGetter<GeofenceOptions?>? geofenceOptions,
    RadarOrPlace? type,
  }) {
    return Parent(
      name: name ?? this.name,
      image: image ?? this.image,
      geofenceOptions: geofenceOptions?.call() ?? this.geofenceOptions,
      type: type ?? this.type,
    );
  }

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);

  Map<String, dynamic> toJson() => _$ParentToJson(this);
}
