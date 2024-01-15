// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiradar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultiRadar _$MultiRadarFromJson(Map<String, dynamic> json) => MultiRadar(
      location: const LocatorConverter()
          .fromJson(json['location'] as Map<String, dynamic>),
      degree: (json['degree'] as num).toDouble(),
      type: $enumDecode(_$RadarTypeEnumMap, json['type']),
      speedLimit: json['speed-limit'] as int,
      radius: (json['radius'] as List<dynamic>?)?.map((e) => e as int).toList(),
      name: json['name'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$MultiRadarToJson(MultiRadar instance) =>
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
  RadarType.pillar: 'pillar',
  RadarType.threeLegged: 'three-legged',
  RadarType.post: 'post',
  RadarType.multiRadar: 'multi-radar',
};
