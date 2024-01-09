// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalUserModel _$LocalUserModelFromJson(Map<String, dynamic> json) =>
    LocalUserModel(
      role: $enumDecode(_$RoleEnumMap, json['role']),
      phoneNumber: json['phone-number'] as String,
    );

Map<String, dynamic> _$LocalUserModelToJson(LocalUserModel instance) =>
    <String, dynamic>{
      'role': _$RoleEnumMap[instance.role]!,
      'phone-number': instance.phoneNumber,
    };

const _$RoleEnumMap = {
  Role.radarAdmin: 'radar-admin',
  Role.user: 'user',
};
