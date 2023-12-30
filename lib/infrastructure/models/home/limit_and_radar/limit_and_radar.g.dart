// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'limit_and_radar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LimitAndRadar _$LimitAndRadarFromJson(Map<String, dynamic> json) =>
    LimitAndRadar(
      id: json['id'] as String,
      territory: json['territory'] as String,
      type: $enumDecodeNullable(_$RadarTypeEnumMap, json['type']),
      speedLimit: json['speed_limit'] as int,
      location: const LatLngJsonConverter().fromJson(json['location'] as List),
      directionType: json['directionType'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$LimitAndRadarToJson(LimitAndRadar instance) =>
    <String, dynamic>{
      'id': instance.id,
      'territory': instance.territory,
      'type': _$RadarTypeEnumMap[instance.type]!,
      'speed_limit': instance.speedLimit,
      'location': const LatLngJsonConverter().toJson(instance.location),
      'directionType': instance.directionType,
      'data': instance.data,
    };

const _$RadarTypeEnumMap = {
  RadarType.onlyLimit: 'only-limit',
  RadarType.limitAndRadar: 'limit-and-radar',
};
