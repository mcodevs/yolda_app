// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'front_radar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FrontRadar _$FrontRadarFromJson(Map<String, dynamic> json) => FrontRadar(
      location: const LocatorConverter()
          .fromJson(json['location'] as Map<String, dynamic>),
      degree: (json['degree'] as num).toDouble(),
      speedLimit: json['speed-limit'] as int,
      icon: json['icon'] as String?,
      name: json['name'] as String?,
      type: $enumDecodeNullable(_$RadarTypeEnumMap, json['type']),
      radius: (json['radius'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$FrontRadarToJson(FrontRadar instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': const LocatorConverter().toJson(instance.location),
      'radius': instance.radius,
      'icon': instance.icon,
      'degree': instance.degree,
      'type': _$RadarTypeEnumMap[instance.type]!,
      'speed-limit': instance.speedLimit,
    };

const _$RadarTypeEnumMap = {
  RadarType.front: 'front',
  RadarType.back: 'back',
  RadarType.twoSide: 'two-side',
};
