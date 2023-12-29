// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Radar _$RadarFromJson(Map<String, dynamic> json) => Radar(
      id: json['id'] as String,
      speedLimit: json['speed_limit'] as int,
      location: const LatLngJsonConverter()
          .fromJson(json['location'] as List<double>),
    );

Map<String, dynamic> _$RadarToJson(Radar instance) => <String, dynamic>{
      'id': instance.id,
      'speed_limit': instance.speedLimit,
      'location': const LatLngJsonConverter().toJson(instance.location),
    };
