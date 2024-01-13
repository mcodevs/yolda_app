import 'package:json_annotation/json_annotation.dart';

enum RadarType {
  @JsonValue('front')
  front,
  @JsonValue('back')
  back,
  @JsonValue("two-side")
  twoSide;

  static Map<RadarType, String> radarTypes = {
    RadarType.front: 'front',
    RadarType.back: 'back',
    RadarType.twoSide: 'two-side',
  };
}
