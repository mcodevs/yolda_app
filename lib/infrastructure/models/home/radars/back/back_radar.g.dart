// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'back_radar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackRadar _$BackRadarFromJson(Map<String, dynamic> json) => BackRadar(
      location: const LocatorConverter()
          .fromJson(json['location'] as Map<String, dynamic>),
      degree: (json['degree'] as num).toDouble(),
      speedLimit: json['speed-limit'] as int,
      radius: (json['radius'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$BackRadarToJson(BackRadar instance) => <String, dynamic>{
      'location': const LocatorConverter().toJson(instance.location),
      'radius': instance.radius,
      'degree': instance.degree,
      'speed-limit': instance.speedLimit,
    };
