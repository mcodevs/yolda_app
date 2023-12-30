import 'package:geofence_service/models/geofence.dart';
import 'package:yolda_app/infrastructure/models/home/radar/radar.dart';

extension ToGeofence on List<Radar> {
  List<Geofence> toGeofence() => map((e) => e.toGeofence()).toList();
}
