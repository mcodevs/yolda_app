import 'package:json_annotation/json_annotation.dart';

enum RadarOrPlace {
  @JsonValue('radar')
  radar,
  @JsonValue('place')
  place,
}