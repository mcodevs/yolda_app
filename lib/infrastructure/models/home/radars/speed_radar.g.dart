// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speed_radar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeedRadar _$SpeedRadarFromJson(Map<String, dynamic> json) => SpeedRadar(
      id: json['id'] as String?,
      name: json['name'] as String,
      type: $enumDecode(_$MarkerTypeEnumMap, json['type']),
      location: const LocationConverter()
          .fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpeedRadarToJson(SpeedRadar instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$MarkerTypeEnumMap[instance.type]!,
      'location': const LocationConverter().toJson(instance.location),
    };

const _$MarkerTypeEnumMap = {
  MarkerType.speedRadar: 'speed-radar',
  MarkerType.beltRadar: 'belt-radar',
  MarkerType.trafficRadar: 'traffic-radar',
  MarkerType.carWash: 'car-wash',
  MarkerType.fuelStation: 'fuel-station',
  MarkerType.autoParts: 'auto-parts',
  MarkerType.carRepair: 'car-repair',
};