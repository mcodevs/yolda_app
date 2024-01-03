import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

extension PositionExtension on Position {
  Point toPoint() => Point(latitude: latitude, longitude: longitude);
}
