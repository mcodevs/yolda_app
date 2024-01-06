import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/domain/common/enums/role.dart';

// part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class UserModel {
  final String name;
  final String phoneNumber;
  final String password;
  final String carNumber;
  final Role role;

  UserModel({
    required this.name,
    required this.phoneNumber,
    required this.password,
    required this.carNumber,
    this.role = Role.user,
  });
}
