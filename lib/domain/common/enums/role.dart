import 'package:json_annotation/json_annotation.dart';

enum Role {
  @JsonValue('admin')
  admin,
  @JsonValue("radar-admin")
  radarAdmin,
  @JsonValue("user")
  user;

  static Role? fromString(String? role) {
    if (role == null) return null;
    
    return Role.admin;
  }
}
