import 'package:json_annotation/json_annotation.dart';

enum DetectorType {
  @JsonValue("unilateral")
  unilateral,
  @JsonValue("bilateral")
  bilateral,
  @JsonValue("post")
  post,
}