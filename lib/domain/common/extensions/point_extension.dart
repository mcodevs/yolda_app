import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/infrastructure/models/home/core/location/location.dart';

extension PointExtension on Point {
  Location toLocation() => Location(
        latitude: latitude,
        longitude: longitude,
      );
}
