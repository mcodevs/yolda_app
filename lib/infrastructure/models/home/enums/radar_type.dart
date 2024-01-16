import 'package:json_annotation/json_annotation.dart';

enum RadarType {
  @JsonValue('pillar')
  pillar("Ustunga o'rnatilgan radar"),
  @JsonValue('three-legged')
  threeLegged("Uch oyoqli radar"),
  @JsonValue('post')
  post("Post"),
  @JsonValue("multi-radar")
  multiRadar("Multiradar");

  final String radarName;

  const RadarType(this.radarName);

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
