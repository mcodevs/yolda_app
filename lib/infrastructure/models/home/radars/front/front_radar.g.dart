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
      radius: (json['radius'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$FrontRadarToJson(FrontRadar instance) =>
    <String, dynamic>{
      'location': const LocatorConverter().toJson(instance.location),
      'radius': instance.radius,
      'degree': instance.degree,
      'speed-limit': instance.speedLimit,
    };
