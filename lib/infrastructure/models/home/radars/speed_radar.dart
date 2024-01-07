import 'package:geofence_service/models/geofence.dart';
import 'package:geofence_service/models/geofence_radius.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/infrastructure/models/home/core/base/base_model.dart';
import 'package:yolda_app/infrastructure/models/home/core/location/location.dart';
import 'package:yolda_app/infrastructure/models/home/core/location/location_converter.dart';
import 'package:yolda_app/infrastructure/models/home/core/marker_type.dart';

part 'speed_radar.g.dart';

@JsonSerializable()
class SpeedRadar extends BaseModel {
  final int speedLimit;
  SpeedRadar({
    super.id,
    required super.name,
    MarkerType? type,
    required super.location,
    required this.speedLimit,
  }) : super(type: type ?? MarkerType.speedRadar);

  factory SpeedRadar.fromJson(Map<String, dynamic> json) =>
      _$SpeedRadarFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SpeedRadarToJson(this);

  @override
  BaseModel copyWith({String? name, MarkerType? type, Location? location}) {
    throw UnimplementedError();
  }

  @override
  PlacemarkMapObject toMarker() {
    return PlacemarkMapObject(
      mapId: MapObjectId(id),
      point: location.toPoint(),
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage('assets/icons/camera.png'),
        ),
      ),
    );
  }

  @override
  Geofence toGeofence() {
    return Geofence(
      id: id,
      latitude: location.latitude,
      longitude: location.longitude,
      radius: [
        GeofenceRadius(id: "600", length: 600),
        GeofenceRadius(id: "300", length: 300),
        GeofenceRadius(id: "150", length: 150),
        GeofenceRadius(id: "50", length: 50),
      ],
    );
  }
}
