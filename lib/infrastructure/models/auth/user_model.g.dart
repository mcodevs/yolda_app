// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      isActive: json['is-active'] as bool,
      name: json['name'] as String,
      phoneNumber: json['phone-number'] as String,
      password: json['password'] as String,
      carNumber: json['car-number'] as String,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']) ?? Role.user,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'is-active': instance.isActive,
      'name': instance.name,
      'phone-number': instance.phoneNumber,
      'password': instance.password,
      'car-number': instance.carNumber,
      'role': _$RoleEnumMap[instance.role]!,
    };

const _$RoleEnumMap = {
  Role.radarAdmin: 'radar-admin',
  Role.user: 'user',
};
