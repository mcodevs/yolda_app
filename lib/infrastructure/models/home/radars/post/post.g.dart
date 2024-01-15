// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      location: const LocatorConverter()
          .fromJson(json['location'] as Map<String, dynamic>),
      degree: (json['degree'] as num).toDouble(),
      type: $enumDecode(_$RadarTypeEnumMap, json['type']),
      radius: (json['radius'] as List<dynamic>?)?.map((e) => e as int).toList(),
      name: json['name'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'name': instance.name,
      'location': const LocatorConverter().toJson(instance.location),
      'radius': instance.radius,
      'icon': instance.icon,
      'degree': instance.degree,
      'type': _$RadarTypeEnumMap[instance.type]!,
    };

const _$RadarTypeEnumMap = {
  RadarType.pillar: 'pillar',
  RadarType.threeLegged: 'three-legged',
  RadarType.post: 'post',
  RadarType.multiRadar: 'multi-radar',
};
