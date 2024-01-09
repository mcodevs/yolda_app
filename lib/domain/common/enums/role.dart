import 'package:json_annotation/json_annotation.dart';

enum Role {
  @JsonValue("radar-admin")
  radarAdmin,
  @JsonValue("user")
  user;


}
