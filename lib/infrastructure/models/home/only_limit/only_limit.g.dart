// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'only_limit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlyLimit _$OnlyLimitFromJson(Map<String, dynamic> json) => OnlyLimit(
      id: json['id'] as String,
      speedLimit: json['speed_limit'] as int,
      location: const LatLngJsonConverter()
          .fromJson(json['location'] as List<double>),
    );

Map<String, dynamic> _$OnlyLimitToJson(OnlyLimit instance) => <String, dynamic>{
      'id': instance.id,
      'speed_limit': instance.speedLimit,
      'location': const LatLngJsonConverter().toJson(instance.location),
    };
