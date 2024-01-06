import 'package:freezed_annotation/freezed_annotation.dart';

enum MarkerType {
  @JsonValue("speed")
  speed("Tezlik chegarasi"),
  @JsonValue("speed-radar")
  speedRadar("Tezlik chegarasi radari"),
  @JsonValue("belt-radar")
  beltRadar("Xavfsizlik kamari radari"),
  @JsonValue("traffic-radar")
  trafficRadar("Svetafor radari"),
  @JsonValue("car-wash")
  carWash("Mashina yuvish shaxobchasi"),
  @JsonValue("fuel-station")
  fuelStation("Yoqilg'i quyish shaxobchasi"),
  @JsonValue("auto-parts")
  autoParts("Avto ehtiyot qismlar do'koni"),
  @JsonValue("car-repair")
  carRepair("Avto ustaxona");

  final String description;

  const MarkerType(this.description);
}
