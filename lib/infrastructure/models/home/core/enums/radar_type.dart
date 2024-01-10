

import 'package:json_annotation/json_annotation.dart';

enum RadarType {
  @JsonValue("behind")
  behind,
  @JsonValue("front")
  front,
  @JsonValue("both")
  both,
}

