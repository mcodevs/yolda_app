import 'package:json_annotation/json_annotation.dart';

enum RadarType {
  @JsonValue('pillar')
  pillar,
  @JsonValue('three-legged')
  threeLegged,
  @JsonValue('post')
  post,
  @JsonValue("multi-radar")
  multiRadar;

  static const types = {
    RadarType.pillar: 'pillar',
    RadarType.threeLegged: 'three-legged',
    RadarType.post: 'post',
    RadarType.multiRadar: 'multi-radar',
  };

  T map<T>({
    required T Function() onPillar,
    required T Function() onThreeLegged,
    required T Function() onPost,
    required T Function() onMultiRadar,
  }) {
    return switch (name) {
      "pillar" => onPillar(),
      "threeLegged" => onThreeLegged(),
      "post" => onPost(),
      "multiRadar" => onMultiRadar(),
      _ => onPillar(),
    };
  }
}
