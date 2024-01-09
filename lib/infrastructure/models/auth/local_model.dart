import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/common/enums/role.dart';

part 'local_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class LocalUserModel {
  Role role;
  String phoneNumber;

  LocalUserModel({
    required this.role,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return _$LocalUserModelToJson(this);
  }

  factory LocalUserModel.fromJson(Map<String, dynamic> json) =>
      _$LocalUserModelFromJson(json);
}
