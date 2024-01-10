// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) => BaseModel(
      parent: const ParentConverter()
          .fromJson(json['parent'] as Map<String, dynamic>),
      geofenceOptions:
          _$JsonConverterFromJson<Map<String, dynamic>, GeofenceOptions>(
              json['geofence-options'],
              const GeofenceOptionsConverter().fromJson),
      locator: const LocatorConverter()
          .fromJson(json['locator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'parent': const ParentConverter().toJson(instance.parent),
      'geofence-options':
          _$JsonConverterToJson<Map<String, dynamic>, GeofenceOptions>(
              instance.geofenceOptions,
              const GeofenceOptionsConverter().toJson),
      'locator': const LocatorConverter().toJson(instance.locator),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
