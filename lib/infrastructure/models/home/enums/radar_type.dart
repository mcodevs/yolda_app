import 'package:json_annotation/json_annotation.dart';

enum RadarType {
  @JsonValue('front')
  front,
  @JsonValue('back')
  back,
  @JsonValue("two-side")
  twoSide,
}
