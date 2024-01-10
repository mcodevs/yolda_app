// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geofence_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeofenceOptions _$GeofenceOptionsFromJson(Map<String, dynamic> json) =>
    GeofenceOptions(
      detectorType:
          $enumDecodeNullable(_$DetectorTypeEnumMap, json['detector-type']),
      radarType: $enumDecodeNullable(_$RadarTypeEnumMap, json['radar-type']),
      radius: (json['radius'] as List<dynamic>?)?.map((e) => e as int).toList(),
      isOpposite: json['is-opposite'] as bool,
      degree: (json['degree'] as num?)?.toDouble(),
      speedLimit: (json['speed-limit'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GeofenceOptionsToJson(GeofenceOptions instance) =>
    <String, dynamic>{
      'detector-type': _$DetectorTypeEnumMap[instance.detectorType],
      'radar-type': _$RadarTypeEnumMap[instance.radarType],
      'radius': instance.radius,
      'is-opposite': instance.isOpposite,
      'degree': instance.degree,
      'speed-limit': instance.speedLimit,
    };

const _$DetectorTypeEnumMap = {
  DetectorType.unilateral: 'unilateral',
  DetectorType.bilateral: 'bilateral',
  DetectorType.post: 'post',
};

const _$RadarTypeEnumMap = {
  RadarType.behind: 'behind',
  RadarType.front: 'front',
  RadarType.both: 'both',
};
