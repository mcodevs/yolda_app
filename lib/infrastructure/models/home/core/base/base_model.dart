import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/infrastructure/models/home/core/geofence_options/geofence_options.dart';
import 'package:yolda_app/infrastructure/models/home/core/geofence_options/geofence_options_converter.dart';

import 'package:yolda_app/infrastructure/models/home/core/locator/locator.dart';
import 'package:yolda_app/infrastructure/models/home/core/locator/locator_converter.dart';
import 'package:yolda_app/infrastructure/models/home/core/parent/parent.dart';
import 'package:yolda_app/infrastructure/models/home/core/parent/parent_converter.dart';

part 'base_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class BaseModel {
  @ParentConverter()
  final Parent parent;
  @GeofenceOptionsConverter()
  final GeofenceOptions? geofenceOptions;
  @LocatorConverter()
  final Locator locator;

  BaseModel({
    required this.parent,
    GeofenceOptions? geofenceOptions,
    required this.locator,
  }) : geofenceOptions = parent.geofenceOptions?.copyWith(
          degree: () => geofenceOptions?.degree,
          detectorType: () => geofenceOptions?.detectorType,
          isOpposite: geofenceOptions?.isOpposite,
          radarType: () => geofenceOptions?.radarType,
          radius: () => geofenceOptions?.radius,
          speedLimit: () => geofenceOptions?.speedLimit,
        );

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}
