// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Locator _$LocatorFromJson(Map<String, dynamic> json) => Locator(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LocatorToJson(Locator instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
