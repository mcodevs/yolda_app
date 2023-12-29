// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'limit_and_radar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LimitAndRadar _$LimitAndRadarFromJson(Map<String, dynamic> json) =>
    LimitAndRadar(
      id: json['id'] as String,
      speedLimit: json['speed_limit'] as int,
      location: const LatLngJsonConverter()
          .fromJson(json['location'] as List<double>),
      type: json['type'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$LimitAndRadarToJson(LimitAndRadar instance) =>
    <String, dynamic>{
      'id': instance.id,
      'speed_limit': instance.speedLimit,
      'location': const LatLngJsonConverter().toJson(instance.location),
      'type': instance.type,
      'data': instance.data,
    };
