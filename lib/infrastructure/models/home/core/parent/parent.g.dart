// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parent _$ParentFromJson(Map<String, dynamic> json) => Parent(
      name: json['name'] as String,
      image: json['image'] as String,
      geofenceOptions: json['geofence-options'] == null
          ? null
          : GeofenceOptions.fromJson(
              json['geofence-options'] as Map<String, dynamic>),
      type: $enumDecode(_$RadarOrPlaceEnumMap, json['type']),
    );

Map<String, dynamic> _$ParentToJson(Parent instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'geofence-options': instance.geofenceOptions,
      'type': _$RadarOrPlaceEnumMap[instance.type]!,
    };

const _$RadarOrPlaceEnumMap = {
  RadarOrPlace.radar: 'radar',
  RadarOrPlace.place: 'place',
};
