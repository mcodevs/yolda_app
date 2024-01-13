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

  T map<T>({
    required T Function() onFront,
    required T Function() onBack,
    required T Function() onTwoSide,
  }) {
    return switch (name) {
      "front" => onFront(),
      "back" => onBack(),
      "twoSide" => onTwoSide(),
      _ => onFront(),
    };
  }
}
